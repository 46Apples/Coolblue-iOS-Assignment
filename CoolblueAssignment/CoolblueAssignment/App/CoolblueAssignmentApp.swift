import SwiftUI

@main
struct CoolblueAssignmentApp: App {
    
    init() {
        // Register all required dependencies with the Dependency Container when the app is initialised.
        registerDependenciesWithContainer()
    }
    
    var body: some Scene {
        WindowGroup {
            buildInitialScreen()
        }
    }
}

// MARK: Private

extension CoolblueAssignmentApp {
    private func registerDependenciesWithContainer() {
        DependencyContainer.registerDependencies()
    }
    
    private func buildInitialScreen() -> some View {
        ProcessInfo.processInfo.arguments.contains("isRunningUITests")
        ? ProductsHomeScreen()
            .environment(\.productsHomeViewModel, ProductHomeViewModel.createTestInstance(
                service: FakeProductsService())
            )
        : ProductsHomeScreen()
            .environment(\.productsHomeViewModel, ProductHomeViewModel())
    }
}
