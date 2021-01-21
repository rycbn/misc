import Foundation
import Combine
import ComposableArchitecture
import Shared

extension ComposableShopClient {
    public static let mock = Self { _ in
        Just(
            [
                .miniDress,
                .cashmereCardigan
            ]
        )
        .setFailureType(to: Error.self)
        .eraseToEffect()
    }
}
