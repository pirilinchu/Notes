//
//  NCard.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import Foundation

struct NCard: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let text: String
    let type: NCardType
    var isFavorite: Bool = false
}

enum NCardType {
    case small
    case medium
}
