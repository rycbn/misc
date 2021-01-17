import Foundation
import Combine
import Product

public final class ShopViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading: Bool = false
    
    let client: VanillaShopClient
    private var cancellable: AnyCancellable?
    
    public init(client: VanillaShopClient) {
        self.client = client
    }
    
    private var url: URL? {
        URL(string: "https://api.net-a-porter.com/NAP/GB/en/300/0/summaries")
    }
    
    public func fetch() {
        guard let url = url else { return }
        isLoading = true
        cancellable = client
            .summary(url)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.isLoading = false
                    case let .failure(error):
                        // handling error message view
                        dump(error.localizedDescription)
                    }
                },
                receiveValue: { [weak self] (products) in
                    self?.products = products
                }
            )
    }
}
