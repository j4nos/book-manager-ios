//
//  BookDetailView.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @ObservedObject var bookData: BookViewModel

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: book.coverImage)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } else if phase.error != nil {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                        .frame(height: 200)
                }
            }

            Text(book.title)
                .font(.title)
                .padding()
            
            Text("by \(book.author)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(book.description)
                .padding()

            // Favorite button
            Button(action: {
                bookData.toggleFavorite(for: book)
            }) {
                Text(book.isFavorite ? "Remove from Favorites" : "Add to Favorites")
                    .padding()
                    .background(book.isFavorite ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .navigationTitle("Book Details")
    }
}
