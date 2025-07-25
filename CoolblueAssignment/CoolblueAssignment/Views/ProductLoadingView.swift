import SwiftUI

// [ProductLoadingView] is a view that represents an activity indicator that wraps [ProgressView].

struct ProductLoadingView: View {
    var body: some View {
        ProgressView("Searching...")
    }
}

#Preview {
    ProductLoadingView()
}
