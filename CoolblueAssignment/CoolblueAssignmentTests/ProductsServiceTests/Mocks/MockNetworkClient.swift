import Foundation
@testable import CoolblueAssignment

class MockNetworkClient: @unchecked Sendable {
    private(set) var actualRequest: URLRequest?
    private var dataToReturn: Data
    
    init(dataToReturn: Data) {
        self.dataToReturn = dataToReturn
    }
    
    func resetForTesting() {
        actualRequest = nil
        dataToReturn = .init()
    }
    
    func didInvokeRequest(
        with url: URL,
        httpMethod: String
    ) -> Bool {
        return actualRequest?.url == url
        && actualRequest?.httpMethod == httpMethod
    }
}

// MARK: [NetworkRequestable] adoption

extension MockNetworkClient: NetworkRequestable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        actualRequest = request
        
        return (dataToReturn, URLResponse())
    }
}
