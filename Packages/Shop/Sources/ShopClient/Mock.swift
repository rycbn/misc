import Combine

extension ShopClient {
    public static let mock = ShopClient { _ in
        Just(
            SummaryResponse(
                summaries: [.miniDress, .cashmereCardigan]
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
