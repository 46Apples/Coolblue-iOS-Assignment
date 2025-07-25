import Testing
import Foundation
@testable import CoolblueAssignment

final class DependencyContainerTests {
    
    @Test("Test that expected dependencies are registered with DI container")
    @MainActor func testExpectedDependenciesAreRegisteredWithDIContainer() {
        #expect(DependencyContainer.resolvedDependency() as NetworkRequestable is URLSession)
        #expect(DependencyContainer.resolvedDependency() as ProductsService is ProductsServiceImplementation)
    }
}
