import SwiftUICore

// A fake view model that can be used to test the various UI view states in the SwiftUI previews without having to make actual network requests to fetch the data.

@Observable @MainActor
final class FakeProductHomeViewModel {
    private(set) var viewState: ProductHomeViewState = .initial
}

// MARK: [ProductHomeViewModelling] adoption

extension FakeProductHomeViewModel: ProductHomeViewModelling {
    func findProducts(using requestModel: ProductSearchRequestModel) async {
        guard !requestModel.searchText.isEmpty else {
            viewState = .initial
            
            return
        }
        
        viewState = .loading
        
        try? await Task.sleep(for: .seconds(2))
        
        viewState = .loaded(products: ProductModel.fakeProducts)
    }
}
