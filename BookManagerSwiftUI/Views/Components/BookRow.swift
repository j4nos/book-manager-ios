//
//  BookRow.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

struct BookRow: View {
    let book: Book

    var body: some View {
        HStack {
            // Load the cover image from a URL using AsyncImage
            AsyncImage(url: URL(string: book.coverImage)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                } else if phase.error != nil {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            
            VStack(alignment: .leading) {
                Text(book.title).bold()
                Text(book.author).font(.subheadline).foregroundColor(.secondary)
            }
        }
    }
}


