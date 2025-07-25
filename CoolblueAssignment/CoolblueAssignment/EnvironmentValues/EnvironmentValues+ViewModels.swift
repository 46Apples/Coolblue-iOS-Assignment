import SwiftUICore

private struct ViewModelKey: @preconcurrency EnvironmentKey {
    @MainActor static let defaultValue: ProductHomeViewModelling = ProductHomeViewModel()
}

extension EnvironmentValues {
    var productsHomeViewModel: ProductHomeViewModelling {
        get { self[ViewModelKey.self] }
        set { self[ViewModelKey.self] = newValue }
    }
}
