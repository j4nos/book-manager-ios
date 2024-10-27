//
//  HomeView.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var bookData: BookViewModel

    var body: some View {
        NavigationView {
            List(bookData.books) { book in
                NavigationLink(destination: BookDetailView(book: book, bookData: bookData)) {
                    BookRow(book: book)
                }
            }
            .navigationTitle("Books")
        }
    }
}

