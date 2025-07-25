@testable import CoolblueAssignment

/// Subclasses [MockStub] in order to get access to generic stubbed responses from the mock.
/// [T] is used to inform [MockStub] what data type it should create a stubbed response for.
@MainActor
final class MockProductsService<T: Any>: MockStub<T> {
    private var didInvokeGetProducts = false
    private var actualRequestModel: ProductSearchRequestModel?
    
    func resetForTesting() {
        super.reset()
        
        didInvokeGetProducts = false
        actualRequestModel = nil
    }
    
    func didInvokeGetProducts(with requestModel: ProductSearchRequestModel) -> Bool {
        didInvokeGetProducts && requestModel == actualRequestModel
    }
}

// MARK: [ProductsService] adoption

extension MockProductsService: ProductsService {
    func getProducts(using requestModel: ProductSearchRequestModel) async throws -> ProductsResponse {
        didInvokeGetProducts = true
        
        actualRequestModel = requestModel
        
        guard let result = stubbedResult else { throw MockError.error }
        
        switch result {
        case .success(let value):
            guard let value = value as? ProductsResponse else { throw MockError.error }
            return value
        case .failure(let error):
            throw error
        }
    }
}
