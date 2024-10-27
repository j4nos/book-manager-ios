//
//  Books.swift
//  BookManagerSwiftUI
//
//  Created by János Kukoda on 2024. 10. 26..
//

import Foundation

struct Book: Identifiable, Codable {
    var id: String
    var title: String
    var author: String
    var coverImage: String // URL or image name
    var description: String
    var isFavorite: Bool
}
