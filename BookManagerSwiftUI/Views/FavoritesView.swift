//
//  FavoritesView.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var bookData: BookViewModel

    var favoriteBooks: [Book] {
        bookData.books.filter { $0.isFavorite }
    }

    var body: some View {
        NavigationView {
            List(favoriteBooks) { book in
                // Use BookRow to display favorite books with images
                BookRow(book: book)
            }
            .navigationTitle("Favorites")
        }
    }
}
