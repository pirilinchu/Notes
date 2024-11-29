//
//  NCardView.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import SwiftUI

struct NCardView: View {

    let card: NCard

    var onToggleFavorite: (() -> Void)?

    func FavoriteButton() -> some View {
        Image(systemName: card.isFavorite ? "heart.fill" : "heart")
            .foregroundStyle(Color.red)
            .onTapGesture {
                onToggleFavorite?()
            }
    }

    @ViewBuilder
    func CardSmallView() -> some View {
        // MARK: Card pequeña
        HStack {
            Text(card.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)
            Text(card.text)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            FavoriteButton()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        .listRowSeparator(.hidden)
    }

    @ViewBuilder
    func CardMediumView() -> some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                FavoriteButton()
            }
            Text(card.title)
                .font(.title2)
                .lineLimit(2)
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)
            Text(card.text)
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 150)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        .listRowSeparator(.hidden)
    }
    
    var body: some View {
        switch card.type {
        case .small:
            CardSmallView()
        case .medium:
            CardMediumView()
        }
    }
}

#Preview {
    VStack {
        NCardView(
            card:
                NCard(title: "Grocery Shopping List",
                      text: "Milk, Bread, Eggs, Cheese, Apples, Carrots, and a few spices.",
                      type: .small
                     )
        )
        NCardView(
            card:
                NCard(title: "Meeting with Marketing Team",
                      text: "Discuss Q1 goals, review social media strategy, and allocate budgets for paid advertising.",
                      type: .small
                     )
        )
        NCardView(
            card:
                NCard(title: "Exercise Routine",
                      text: "Monday: Chest and Triceps\nTuesday: Back and Biceps\nWednesday: Legs and Core\nThursday: Shoulders\nFriday: Cardio and Abs",
                      type: .medium
                     )
        )
        NCardView(
            card:
                NCard(title: "Reading List for the Month",
                      text: "1. 'Atomic Habits' by James Clear\n2. 'The Pragmatic Programmer'\n3. 'SwiftUI Essentials' by Apple\n4. 'Clean Code' by Robert C. Martin",
                      type: .medium
                     )
        )
        NCardView(
            card:
                NCard(title: "Project Goals: Mobile App Launch",
                      text: """
                      Key objectives:
                      1. Complete UI/UX design by end of month.
                      2. Integrate authentication and payment features.
                      3. Conduct usability testing with at least 20 participants.
                      4. Prepare marketing materials for launch, including screenshots and video previews.
                      """,
                      type: .medium
                     )
        )
    }
    .padding()
}



