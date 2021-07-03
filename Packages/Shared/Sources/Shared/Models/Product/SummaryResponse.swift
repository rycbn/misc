import Foundation

public struct SummaryResponse: Codable, Equatable, Hashable {
    public let summaries: [Product]
    
    public init(summaries: [Product]) {
        self.summaries = summaries
    }
}

