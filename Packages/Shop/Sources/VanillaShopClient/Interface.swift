import Foundation
import Combine
import Product

public struct VanillaShopClient {
    public let summary: (URL) -> AnyPublisher<SummaryResponse, Error>
    
    public init(summary: @escaping (URL) -> AnyPublisher<SummaryResponse, Error>) {
        self.summary = summary
    }
}
