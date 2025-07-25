protocol ProductHomeViewModelling: Sendable {
    @MainActor var viewState: ProductHomeViewState { get }
    
    func findProducts(using requestModel: ProductSearchRequestModel) async
}
