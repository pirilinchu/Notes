//
//  NDetailView.swift
//  Notes
//
//  Created by Santiago Mendoza on 28/11/24.
//

import SwiftUI

struct NDetailView: View {
    @State var card: NCard
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(card.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(card.text)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    NDetailView(card: NCard(title: "Titulo", text: "text", type: .small))
}
