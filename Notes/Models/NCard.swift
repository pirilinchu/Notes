//
//  NCard.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import Foundation

struct NCard: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let type: NCardType
}

enum NCardType {
    case small
    case medium
}
