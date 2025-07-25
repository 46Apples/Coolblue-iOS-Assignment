import Foundation

extension DependencyContainer {
    static func registerDependencies() {
        Self.register(URLSession.shared as NetworkRequestable)
        Self.register(ProductsServiceImplementation() as ProductsService)
    }
}
