import Testing
@testable import CoolblueAssignment

final class ProductHomeViewModelTests {
    private var serviceUnderTest: ProductHomeViewModel?
    private var mockService: MockProductsService<Any>?
    
    deinit {
        resetServiceUnderTest()
        
        resetMocks()
    }
    
    @Test("findProducts() that completes with error")
    @MainActor func testFindProductsThatFails() async {
        try? createServiceUnderTest(
            service: Mock.stubbed(
                result: .failure(
                    MockError.error
                )
            )
        )
        
        #expect(serviceUnderTest?.viewState == .initial)
        
        await serviceUnderTest?.findProducts(using: .mockRequestModel)
        
        #expect(mockService?.didInvokeGetProducts(with: .mockRequestModel) == true)
        
        #expect(serviceUnderTest?.viewState == .error)
    }
    
    @Test("findProducts() when no search text present in request model")
    @MainActor func testFindProductsWhenSearchTextIsEmpty() async {
        try? createServiceUnderTest(
            service: Mock.stubbed(
                result: .success(
                    ProductsResponse.mockDecodedEmptyResponse
                )
            )
        )
        
        #expect(serviceUnderTest?.viewState == .initial)
        
        await serviceUnderTest?.findProducts(using: .mockEmptyRequestModel)
        
        #expect(mockService?.didInvokeGetProducts(with: .mockEmptyRequestModel) == false)
        
        #expect(serviceUnderTest?.viewState == .initial)
    }
    
    @Test("findProducts() that completes with no results")
    @MainActor func testFindProductsThatSucceedsWithEmptyResults() async {
        try? createServiceUnderTest(
            service: Mock.stubbed(
                result: .success(
                    ProductsResponse.mockDecodedEmptyResponse
                )
            )
        )
        
        #expect(serviceUnderTest?.viewState == .initial)
        
        await serviceUnderTest?.findProducts(using: .mockRequestModel)
        
        #expect(mockService?.didInvokeGetProducts(with: .mockRequestModel) == true)
        
        #expect(serviceUnderTest?.viewState == .empty)
    }
    
    @Test("findProducts() that completes with list of products")
    @MainActor func testFindProductsThatSucceedsWithListOfProducts() async {
        try? createServiceUnderTest(
            service: Mock.stubbed(
                result: .success(
                    ProductsResponse.mockDecodedResponse
                )
            )
        )
        
        #expect(serviceUnderTest?.viewState == .initial)
        
        await serviceUnderTest?.findProducts(using: .mockRequestModel)
        
        #expect(mockService?.didInvokeGetProducts(with: .mockRequestModel) == true)
        
        #expect(serviceUnderTest?.viewState == .loaded(products: ProductsResponse.mockDecodedResponse.parse()))
    }
}

// MARK: Private

extension ProductHomeViewModelTests {
    @MainActor private func createServiceUnderTest(
        service: MockProductsService<Any>?
    ) throws {
        mockService = service
        
        serviceUnderTest = ProductHomeViewModel.createTestInstance(service: try #require(mockService))
    }
    
    private func resetServiceUnderTest() {
        serviceUnderTest = nil
    }
    
    private func resetMocks() {
        mockService = nil
    }
}
