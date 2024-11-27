//
//  PickersPractice.swift
//  Notes
//
//  Created by Santiago Mendoza on 27/11/24.
//

import SwiftUI

struct PickersPractice: View {
    @State var date: Date = Date()
    @State var category: Int = 0
    @State var size: NCardType = .small
    var body: some View {
//        DatePicker("date", selection: $date, displayedComponents: [.hourAndMinute])
//            .datePickerStyle(.wheel)
//            .padding()
//        Picker("Categories", selection: $category) {
//            Text("0").tag(0)
//            Text("1").tag(1)
//            Text("2").tag(2)
//        }
//        .pickerStyle(.segmented)

        Picker("Tamaños", selection: $size) {
            Text("Pequeño").tag(NCardType.small)
            Text("Mediano").tag(NCardType.medium)
        }
    }
}

#Preview {
    PickersPractice()
}
