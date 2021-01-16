import Foundation
import ComposableArchitecture
import Product

public struct ComposableShopClient {
    public let summary: (URL) -> Effect<SummaryResponse, Error>

    public init(summary: @escaping (URL) -> Effect<SummaryResponse, Error>) {
        self.summary = summary
    }
}
