import Foundation

@MainActor
struct ProductsServiceImplementation {
    // [URLSession.shared] is registered in the Dependency Container as a [NetworkRequestable] conforming type. Decoupling the [ProductsServiceImplementation] from that knowledge allows injecting alternative [NetworkRequestable] implementations easily in its test suite.
    @Inject private var networkService: NetworkRequestable
}

// MARK: [ProductsService] adoption

extension ProductsServiceImplementation: ProductsService {
    func getProducts(using requestModel: ProductSearchRequestModel) async throws -> ProductsResponse {
        let request = URLRequest.create(
            for: .productSearch,
            queryItems: buildProductSearchUrlQueryItems(using: requestModel)
        )
        
        let (data, _) = try await networkService.data(for: request)
        
        return try JSONDecoder().decode(
            ProductsResponse.self,
            from: data
        )
    }
}

// MARK: Private

extension ProductsServiceImplementation {
    private func buildProductSearchUrlQueryItems(using requestModel: ProductSearchRequestModel) -> [URLQueryItem] {
        [
            .init(name: "query", value: requestModel.searchText),
            .init(name: "page", value: "\(requestModel.page)")
        ]
    }
}

// Allow access to the test instance factory method only in [DEBUG] configuration.

#if DEBUG

// MARK: Factory methods

extension ProductsServiceImplementation {
    // A factory method to create an instance of the service layer implementation for testing, using a mocked network client instance.
    static func createTestInstance(
        networkService: NetworkRequestable
    ) -> ProductsServiceImplementation {
        var result = ProductsServiceImplementation()
        
        result.set(networkService)
        
        return result
    }
    
    private mutating func set(_ networkService: NetworkRequestable) {
        self.networkService = networkService
    }
}

#endif
