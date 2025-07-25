import SwiftUICore

@Observable @MainActor
final class ProductHomeViewModel {
    // [@ObservationIgnored] added to the [ProductsService] property declaration, as the [@Inject] property wrapper cannot be used in a class marked with [@Observable]. This is because properties are converted into computed properties under the hood when using [@Observable].
        @ObservationIgnored
    @ObservationIgnored @Inject private var service: ProductsService
    private(set) var viewState: ProductHomeViewState = .initial
}

// MARK: [ProductHomeViewModelling] adoption

extension ProductHomeViewModel: ProductHomeViewModelling {
    func findProducts(using requestModel: ProductSearchRequestModel) async {
        guard searchTextPresent(in: requestModel) else {
            setInitialViewState()
            
            return
        }
        
        setLoadingViewState()
        
        do {
            handleProductSearch(response: try await service.getProducts(using: requestModel))
        } catch {
            setErrorViewState()
        }
    }
}

// MARK: Private

extension ProductHomeViewModel {
    private func searchTextPresent(in requestModel: ProductSearchRequestModel) -> Bool {
        !requestModel.searchText.isEmpty
    }
    
    private func handleProductSearch(response: ProductsResponse) {
        if response.products.isEmpty {
            setEmptyViewState()
        } else {
            setLoadedViewState(using: response)
        }
    }
}

// MARK: View states

extension ProductHomeViewModel {
    private func setInitialViewState() {
        viewState = .initial
    }
    
    private func setLoadingViewState() {
        viewState = .loading
    }
    
    private func setEmptyViewState() {
        viewState = .empty
    }
    
    private func setLoadedViewState(using response: ProductsResponse) {
        viewState = .loaded(
            products: response.parse()
        )
    }
    
    private func setErrorViewState() {
        viewState = .error
    }
}

// Allow access to the test instance factory method only in [DEBUG] configuration.

#if DEBUG

// MARK: Factory methods

extension ProductHomeViewModel {
    // A factory method to create an instance of the view model for testing, using a mocked service instance required during test setup.
    static func createTestInstance(
        service: ProductsService
    ) -> ProductHomeViewModel {
        let result = ProductHomeViewModel()
        
        result.service = service
        
        return result
    }
}

#endif
