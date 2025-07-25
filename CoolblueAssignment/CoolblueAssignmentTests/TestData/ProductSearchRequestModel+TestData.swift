@testable import CoolblueAssignment

// [ProductSearchRequestModel] test data

extension ProductSearchRequestModel {
    static var mockEmptyRequestModel: ProductSearchRequestModel {
        .init(searchText: "", page: 1)
    }
    
    static var mockRequestModel: ProductSearchRequestModel {
        .init(searchText: "Mock search text", page: 1)
    }
}
