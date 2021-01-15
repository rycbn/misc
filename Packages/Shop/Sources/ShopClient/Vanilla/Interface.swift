import Foundation
import Combine

public struct VanillaShopClient {
    public let summary: (URL) -> AnyPublisher<SummaryResponse, Error>
    
    public init(summary: @escaping (URL) -> AnyPublisher<SummaryResponse, Error>) {
        self.summary = summary
    }
}
