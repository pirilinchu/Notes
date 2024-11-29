//
//  NListView.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import SwiftUI

struct NListView: View {
    @EnvironmentObject var appInfo: AppInfo

    @State var showSheet: Bool = false
    @State var showDetails: Bool = false
    @State var selectedCard: NCard?

    var forFavorites: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach (forFavorites ? appInfo.favorites : appInfo.cards) { card in
                    NCardView(card: card) {
                        appInfo.toggleFavorite(card: card)
                    }
                        .onTapGesture {
                            selectedCard = card
                            showDetails = true
                        }
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $showSheet) {
                NCreateNoteView() { card in
                    appInfo.createNote(card: card)
                    showSheet = false
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                if let selectedCard {
                    NDetailView(card: selectedCard)
                }
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.cyan.opacity(0.4), for: .navigationBar)
            .toolbar {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NListView()
        .environmentObject(AppInfo())
}
