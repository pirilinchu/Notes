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
        TabView {
            NListView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            NListView(forFavorites: true)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
            .environmentObject(appInfo)
    }
}

#Preview {
    ContentView()
}
