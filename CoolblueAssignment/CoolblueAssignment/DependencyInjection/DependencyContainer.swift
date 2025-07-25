import Swinject

// A simple Dependency Injection Container api to register concrete implementations for given abstractions (in the form of protocols), using the [Swinject] dependency internally to manage the dependencies.

@MainActor
final class DependencyContainer {
    static private let container = Container()
    
    private init() { }
    
    static func register<T>(_ dependency: T) {
        container.register(T.self) { _ in dependency }
    }
    
    static func resolvedDependency<T>() -> T {
        let dependency = container.resolve(T.self)
        
        precondition(dependency != nil, "No dependency was registered for \(T.self)! Please register the appropriate dependency before calling resolve.")
        
        return dependency!
    }
}
