enum ProductHomeViewState: Equatable {
    case initial
    case loading
    case loaded(products: [ProductModel])
    case empty
    case error
}
