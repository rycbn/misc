import Foundation
import ComposableArchitecture
import Product

public struct ComposableShopClient {
    public let summary: (URL) -> Effect<[Product], Error>

    public init(summary: @escaping (URL) -> Effect<[Product], Error>) {
        self.summary = summary
    }
}
