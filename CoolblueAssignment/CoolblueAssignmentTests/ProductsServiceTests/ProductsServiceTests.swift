import Testing
import Foundation
@testable import CoolblueAssignment

final class ProductsServiceTests {
    private var serviceUnderTest: ProductsServiceImplementation?
    private var mockNetworkClient: MockNetworkClient?
    
    deinit {
        resetServiceUnderTest()
        
        resetMocks()
    }
    
    @Test("getProducts() should invoke network client with expected parameters and return expected response")
    @MainActor func testGetProducts() async {
        try? createServiceUnderTest(networkClient: .init(dataToReturn: .mockRawResponse))
        
        let actual = try? await serviceUnderTest?.getProducts(using: .init(searchText: "mock", page: 1))
        
        #expect(actual == .mockDecodedResponse)
        
        #expect(mockNetworkClient?.didInvokeRequest(
            with: .expectedProductSearchURL,
            httpMethod: .expectedHttpMethod
        ) == true)
    }
}

// MARK: Private

extension ProductsServiceTests {
    @MainActor private func createServiceUnderTest(
        networkClient: MockNetworkClient
    ) throws {
        mockNetworkClient = networkClient
        
        serviceUnderTest = ProductsServiceImplementation.createTestInstance(
            networkService: try #require(mockNetworkClient)
        )
    }
    
    func resetServiceUnderTest() {
        serviceUnderTest = nil
    }
    
    private func resetMocks() {
        mockNetworkClient = nil
    }
}

// MARK: Test constants

fileprivate extension URL {
    static var expectedProductSearchURL: URL { URL(string: .expectedProductSearchURLString)! }
}

fileprivate extension String {
    static var expectedProductSearchURLString: String {
        "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search?query=mock&page=1"
    }
}

fileprivate extension String {
    static var expectedHttpMethod: String { "GET" }
}
