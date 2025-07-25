extension ProductsResponse {
    func parse() -> [ProductModel] {
        self.products.reduce(into: [ProductModel]()) { result, element in
            result.append(
                .init(
                    id: element.productId,
                    name: element.productName,
                    imageUrl: element.productImage,
                    features: element.USPs,
                    priceInclVat: String(format: "%.2f", element.salesPriceIncVat)
                )
            )
        }
    }
}
