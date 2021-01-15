import Foundation
import Combine

public struct ShopClient {
    public let summary: (URL) -> AnyPublisher<SummaryResponse, Error>
    
    public init(summary: @escaping (URL) -> AnyPublisher<SummaryResponse, Error>) {
        self.summary = summary
    }
}
