import Foundation

// Factory methods to create [URLRequest] instances configured for a given [ServiceTarget].

extension URLRequest {
    static func create(
        for target: ProductsServiceTarget,
        queryItems: [URLQueryItem]
    ) -> URLRequest {
        var result = URLRequest.create(for: target)
        
        result.url?.append(queryItems: queryItems)
        
        return result
    }
}

// MARK: Private

extension URLRequest {
    private static func create(for target: ProductsServiceTarget) -> URLRequest {
        var result = URLRequest(url: target.url)
        
        result.httpMethod = target.httpMethod
        
        return result
    }
}
