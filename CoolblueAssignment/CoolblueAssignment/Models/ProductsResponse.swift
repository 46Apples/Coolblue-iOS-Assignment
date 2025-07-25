struct ProductsResponse: Decodable, Equatable {
    let products: [ProductItemResponse]
}
