import Foundation
import ComposableArchitecture
import Shared

public struct ComposableShopClient {
    public let summary: (URL) -> Effect<[Product], Failure>

    public init(summary: @escaping (URL) -> Effect<[Product], Failure>) {
        self.summary = summary
    }
    
    public struct Failure: Error, Equatable {}
}
