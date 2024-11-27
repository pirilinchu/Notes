//
//  AlertsPractice.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import SwiftUI

struct AlertsPractice: View {
    @State var showSheet: Bool = false

    var body: some View {
        VStack {
            Button("Show Sheet") {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            NCreateNoteView()
        }
    }
}

#Preview {
    AlertsPractice()
}
