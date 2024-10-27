//
//  BookData.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import SwiftUI

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    private let booksKey = "books"
    
    init() {
        loadBooks()
    }
    
    func loadBooks() {
        if ProcessInfo.processInfo.environment["UITesting"] == "true" {
            if let booksFromJSON = loadBooksFromJSON() {
                books = booksFromJSON
                saveBooks() // Save loaded books to UserDefaults for future use
            }
        } else {
            if let savedBooks = UserDefaults.standard.data(forKey: booksKey),
               let decodedBooks = try? JSONDecoder().decode([Book].self, from: savedBooks) {
                books = decodedBooks
            } else {
                // Load from Books.json if no data in UserDefaults
                if let booksFromJSON = loadBooksFromJSON() {
                    books = booksFromJSON
                    saveBooks() // Save loaded books to UserDefaults for future use
                }
            }
        }
    }

    func loadBooksFromJSON() -> [Book]? {
        guard let url = Bundle.main.url(forResource: "Books", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let books = try? JSONDecoder().decode([Book].self, from: data) else {
            return nil
        }
        return books
    }
    
    func saveBooks() {
        if let encodedBooks = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encodedBooks, forKey: booksKey)
        }
    }
    
    func toggleFavorite(for book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isFavorite.toggle()
            saveBooks()
        }
    }
}
