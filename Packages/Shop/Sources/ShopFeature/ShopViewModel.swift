import Foundation
import Combine
import ShopClient

public final class ShopViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading: Bool = true
    
    let client: ShopVanillaClient
    private var cancellable: AnyCancellable?
    
    public init(client: ShopVanillaClient) {
        self.client = client
    }
    
    private var url: URL {
        URL(string: "https://api.net-a-porter.com/NAP/GB/en/300/0/summaries")!
    }
    
    public func fetch() {
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
                receiveValue: { [weak self] (response) in
                    self?.products = response.summaries
                }
            )
    }
}
