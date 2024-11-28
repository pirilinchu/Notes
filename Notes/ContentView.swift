//
//  ContentView.swift
//  Notes
//
//  Created by Santiago Mendoza on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appInfo = AppInfo()

    var body: some View {
        NListView()
            .environmentObject(appInfo)
    }
}

#Preview {
    ContentView()
}
