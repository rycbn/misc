import Foundation
import Combine
import Shared

public struct VanillaShopClient {
    public let summary: (URL) -> AnyPublisher<[Product], Error>
    
    public init(summary: @escaping (URL) -> AnyPublisher<[Product], Error>) {
        self.summary = summary
    }
}
