import Foundation
import Combine
import ComposableArchitecture
import Product

extension ComposableShopClient {
    public static let mock = Self { _ in
        Just(
            SummaryResponse(
                summaries: [.miniDress, .cashmereCardigan]
            )
        )
        .setFailureType(to: Error.self)
        .eraseToEffect()
    }
}
