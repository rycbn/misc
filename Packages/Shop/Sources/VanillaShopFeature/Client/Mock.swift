import Combine
import Shared

extension VanillaShopClient {
    public static let mock = Self { _ in
        Just(
            [
                .miniDress,
                .cashmereCardigan
            ]
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
