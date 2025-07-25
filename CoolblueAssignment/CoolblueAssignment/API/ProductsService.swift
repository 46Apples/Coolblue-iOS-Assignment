protocol ProductsService: Sendable {
    func getProducts(using requestModel: ProductSearchRequestModel) async throws -> ProductsResponse
}
