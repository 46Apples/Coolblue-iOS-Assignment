import XCTest

final class ProductSearchUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testFindProductsUsingSearchBar() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        // Assert prompt text view is visible with expected text
        let promptTextView = app.staticTexts["promptTextView"]
        XCTAssertTrue(promptTextView.waitForExistence(timeout: 2))
        XCTAssertEqual("Search for a product by using the search bar above", promptTextView.label)
        
        // Assert search bar exists, and tap on it
        let searchBar = app.searchFields.firstMatch
        XCTAssertTrue(searchBar.exists)
        searchBar.tap()
        
        // Enter search text into the search bar, and begin search
        searchBar.typeText("apple")
        app.keyboards.buttons["Search"].tap()
        
        // Assert that the activity inidcator is visible during the network request
        let activityIndicator = app.activityIndicators.firstMatch
        XCTAssertTrue(activityIndicator.waitForExistence(timeout: 1))
        XCTAssertEqual("Searching...", activityIndicator.label)
        
        // Assert that a list view is loaded once the network request to fetch the products completes
        let listView = app.collectionViews.firstMatch
        XCTAssertTrue(listView.waitForExistence(timeout: 2))
        let listViewItemCount = listView.cells.count
        XCTAssertEqual(5, listViewItemCount)
        
        // Assert the first product list item's values
        var listViewItem = listView.cells.element(boundBy: 0)
        var productImageView = listViewItem.images["productImageView"]
        XCTAssertTrue(productImageView.exists)
        var titleTextView = listViewItem.staticTexts["productNameTextView"]
        XCTAssertEqual("Apple iPhone 6 32GB Grijs", titleTextView.label)
        var featureTextView = listViewItem.staticTexts.element(boundBy: 2)
        XCTAssertEqual("32 GB opslagcapaciteit", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 4)
        XCTAssertEqual("4,7 inch Retina HD scherm", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 6)
        XCTAssertEqual("iOS 11", featureTextView.label)
        var priceTextView = listViewItem.staticTexts.element(boundBy: 7)
        XCTAssertEqual("369.00", priceTextView.label)
        
        // Assert the second product list item's values
        listViewItem = listView.cells.element(boundBy: 2)
        productImageView = listViewItem.images["productImageView"]
        XCTAssertTrue(productImageView.exists)
        titleTextView = listViewItem.staticTexts["productNameTextView"]
        XCTAssertEqual("Apple iPhone X 64GB Space Gray", titleTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 2)
        XCTAssertEqual("64 GB opslagcapaciteit", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 4)
        XCTAssertEqual("5,8 inch Retina HD scherm", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 6)
        XCTAssertEqual("iOS 11", featureTextView.label)
        priceTextView = listViewItem.staticTexts.element(boundBy: 7)
        XCTAssertEqual("1079.00", priceTextView.label)
        
        // Assert the thrid product list item's values
        listViewItem = listView.cells.element(boundBy: 4)
        productImageView = listViewItem.images["productImageView"]
        XCTAssertTrue(productImageView.exists)
        titleTextView = listViewItem.staticTexts["productNameTextView"]
        XCTAssertEqual("Apple iPhone 8 64GB Space Grey", titleTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 2)
        XCTAssertEqual("64 GB opslagcapaciteit", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 4)
        XCTAssertEqual("4,7 inch Retina HD scherm", featureTextView.label)
        featureTextView = listViewItem.staticTexts.element(boundBy: 6)
        XCTAssertEqual("iOS 11", featureTextView.label)
        priceTextView = listViewItem.staticTexts.element(boundBy: 7)
        XCTAssertEqual("769.00", priceTextView.label)
    }
}
