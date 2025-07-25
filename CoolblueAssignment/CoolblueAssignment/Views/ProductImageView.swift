import SwiftUI

// [ProductImageView] is a view that wraps [AsyncImage] for loading a product's image from a given URL.

struct ProductImageView: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 200)
            default:
                ProgressView()
            }
        }
        .accessibilityIdentifier("productImageView")
    }
}

#Preview {
    ProductImageView(imageUrl: "https://image.coolblue.nl/300x750/products/943711")
}
