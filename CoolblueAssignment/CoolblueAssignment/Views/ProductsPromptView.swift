import SwiftUI

// [ProductsPromptView] is a view that is shown to the user when no product search is being performed, and thus prompts the user to use the search bar to search for products.

struct ProductsPromptView: View {
    var body: some View {
        Text("Search for a product by using the search bar above")
            .accessibilityIdentifier("promptTextView")
            .titleStyle(foregroundColor: .gray)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ProductsPromptView()
}
