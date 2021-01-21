import Foundation
import Shared

extension VanillaShopClient {
    public static let live = Self { url in
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SummaryResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .map(\.summaries)
            .eraseToAnyPublisher()
    }
}
