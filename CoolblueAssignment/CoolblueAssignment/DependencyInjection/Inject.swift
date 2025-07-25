// The [Inject] property wrapper is used in types to resolve a given protocol to a concrete implementation instance.

@propertyWrapper
struct Inject<T> {
    var wrappedValue: T
    
    @MainActor
    init() {
        wrappedValue = DependencyContainer.resolvedDependency()
    }
}
