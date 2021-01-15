import Foundation
import ComposableArchitecture

public struct CompoableShopClient {
    public let summary: (URL) -> Effect<Void, Void>
}
