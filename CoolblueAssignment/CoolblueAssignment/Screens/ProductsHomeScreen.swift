import SwiftUI

struct ProductsHomeScreen: View {
    @Environment(\.productsHomeViewModel) private var viewModel: ProductHomeViewModelling
    @State private var searchText = ""
    private var viewState: ProductHomeViewState { viewModel.viewState }
    
    var body: some View {
        NavigationStack {
            switch viewState {
            case .initial:
                ProductsPromptView()
            case .loading:
                ProductLoadingView()
            case .loaded(let products):
                ProductResultsListView(products: products)
            case .empty:
                ProductsEmptyView(searchText: $searchText)
            case .error:
                ProductsErrorView {
                    performSearch()
                }
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search, performSearch)
        .onChange(of: searchText) { _, newValue in
            if newValue.isEmpty {
                performSearch()
            }
        }
    }
}

// MARK: Private

extension ProductsHomeScreen {
    func performSearch() {
        Task {
            await viewModel.findProducts(using: .init(searchText: searchText))
        }
    }
}

#Preview {
    ProductsHomeScreen()
        .environment(\.productsHomeViewModel, FakeProductHomeViewModel())
}
