import SwiftUI

// [ProductsEmptyView] is a view that is used to inform the user that no products were found in a given product search.

struct ProductsEmptyView: View {
    @Binding var searchText: String
    
    var body: some View {
        Text("No results for '\(searchText)'")
            .subtitleStyle()
    }
}

#Preview {
    @Previewable @State var searchText = "Foo Bar"
    
    ProductsEmptyView(searchText: $searchText)
}
