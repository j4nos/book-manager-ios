//
//  ContentView.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bookData = BookViewModel()

    var body: some View {
        TabView {
            HomeView(bookData: bookData)
                .tabItem {
                    Label("Home", systemImage: "book")
                }
            
            FavoritesView(bookData: bookData)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContentView()
}
