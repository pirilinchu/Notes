//
//  NCreateNoteView.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import SwiftUI

struct NCreateNoteView: View {
    @StateObject var viewModel: NCreateNoteViewModel = NCreateNoteViewModel()

    var onNoteCreated: ((NCard) -> Void)?

    func onTap() {
        // crear nota
        let card = viewModel.createNote()

        print("Esta es tu nueva card: \(card)")

        onNoteCreated?(card)
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Crear Nueva Nota")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)
                TextField("Título", text: $viewModel.title)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                HStack {
                    Text("Tamaño")
                    Spacer()
                    Picker("Tamaños", selection: $viewModel.size) {
                        Text("Pequeño").tag(NCardType.small)
                        Text("Mediano").tag(NCardType.medium)
                    }
                }
                .padding()
                Toggle("Marcar como favorito", isOn: $viewModel.isFavorite)
                    .padding()

                Button {
                    onTap()
                } label: {
                    Text("Guardar Nota")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    NCreateNoteView()
}
