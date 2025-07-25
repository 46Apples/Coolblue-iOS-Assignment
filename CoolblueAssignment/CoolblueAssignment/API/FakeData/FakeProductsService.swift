// A fake implementation of the [ProductsService] protocol that is used when running UI tests.

final class FakeProductsService: ProductsService {
    func getProducts(using requestModel: ProductSearchRequestModel) async throws -> ProductsResponse {
        // Sleep for 2 seconds to ensure activity indicator is present in UI tests.
        try? await Task.sleep(for: .seconds(2))
        
        return ProductsResponse.fakeDecodedResponse
    }
}
