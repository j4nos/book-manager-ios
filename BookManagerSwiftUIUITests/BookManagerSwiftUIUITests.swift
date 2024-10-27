//
//  BookManagerSwiftUIUITests.swift
//  BookManagerSwiftUIUITests
//
//  Created by János Kukoda on 2024. 10. 26..
//

import XCTest

final class BookManagerSwiftUIUITests: XCTestCase {
    
    func testAddBookToFavoritesAndCheckFavorites() {
        let app = XCUIApplication()
        app.terminate()
        app.launchEnvironment["UITesting"] = "true"
        app.launch()
        
        // Step 1: Locate a specific book in the list by its title
        let bookTitle = "1984, George Orwell"
        let bookRow = app.buttons[bookTitle]
        XCTAssertTrue(bookRow.exists, "The book should be present in the list.")
        
        // Step 2: Tap the book row to open details
        bookRow.tap()
        
        // Step 3: Mark the book as favorite
        let favoriteButton = app.buttons["Add to Favorites"] // Update to match accessibility label
        XCTAssertTrue(favoriteButton.exists, "The favorite button should exist on the detail page.")
        favoriteButton.tap()
        
        // Step 4: Go back to the main list
        app.navigationBars.buttons["Books"].tap() // Adjust if there's a different back navigation
        
        // Step 5: Navigate to Favorites view
        let favoritesTab = app.tabBars.buttons["Favorites"] // Update if tab is different
        favoritesTab.tap()
        
        // Step 6: Verify the book is in the favorites list
        let favoriteBookRow = app.staticTexts["1984"]
        XCTAssertTrue(favoriteBookRow.exists, "The book should appear in the favorites list.")
    }
}
