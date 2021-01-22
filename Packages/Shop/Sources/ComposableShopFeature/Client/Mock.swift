import Foundation
import Combine
import ComposableArchitecture
import Shared

extension ComposableShopClient {
    public static let mock = Self { _ in
        Just([.miniDress, .cashmereCardigan ])
            .setFailureType(to: Failure.self)
            .eraseToEffect()
    }
    
    public static let unhappyPath = Self { _ in
        Fail(error: ComposableShopClient.Failure())
            .eraseToEffect()
    }
    
    public static let empty = Self { _ in
        Just([])
            .setFailureType(to: Failure.self)
            .eraseToEffect()
    }
}
