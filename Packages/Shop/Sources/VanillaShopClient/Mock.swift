import Combine
import Product

extension VanillaShopClient {
    public static let mock = Self { _ in
        Just(
            SummaryResponse(
                summaries: [.miniDress, .cashmereCardigan]
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
