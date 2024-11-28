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

    var body: some View {
        NavigationStack {
            List {
                ForEach (appInfo.cards) { card in
                    NCardView(card: card)
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
            .overlay {
                VStack {
                    Spacer()
                    Button("Create note") {
                        showSheet = true
                    }
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                if let selectedCard {
                    NDetailView(card: selectedCard)
                }
            }
        }
    }
}

#Preview {
    NListView()
        .environmentObject(AppInfo())
}
