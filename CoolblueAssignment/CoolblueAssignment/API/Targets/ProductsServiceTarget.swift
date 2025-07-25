import Foundation

enum ProductsServiceTarget {
    case productSearch
}

extension ProductsServiceTarget {
    var url: URL {
        switch self {
        default: return URL(string: "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search")!
        }
    }
    
    var httpMethod: String {
        switch self {
        default: return "GET"
        }
    }
}
