import Foundation
import ComposableArchitecture
import Shared

extension ComposableShopClient {
    public static let live = Self { url in
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SummaryResponse.self, decoder: JSONDecoder())
            .map(\.summaries)
            .eraseToEffect()
    }
}
