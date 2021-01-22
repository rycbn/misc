import XCTest
@testable import ComposableShopFeature
import ComposableArchitecture

final class ComposableShopFeatureTests: XCTestCase {
    
    private let scheduler = DispatchQueue.testScheduler
    
    func testHappyPathFlow() {
        let store = TestStore(
            initialState: .init(),
            reducer: shopReducer,
            environment: .init(
                client: .mock,
                mainQueue: scheduler.eraseToAnyScheduler()
            )
        )
        
        store.assert(
            .send(.onAppear) {
                $0.isLoading = true
            },
            .do {
                self.scheduler.advance()
            },
            .receive(.response(.success([.miniDress, .cashmereCardigan]))) {
                $0.isLoading = false
                $0.products = [.miniDress, .cashmereCardigan]
            }
        )
    }
    
    func testUnhappyPathFlow() {
        let store = TestStore(
            initialState: .init(),
            reducer: shopReducer,
            environment: .init(
                client: .unhappyPath,
                mainQueue: scheduler.eraseToAnyScheduler()
            )
        )
        
        store.assert(
            .send(.onAppear) {
                $0.isLoading = true
            },
            .do {
                self.scheduler.advance()
            },
            .receive(.response(.failure(ComposableShopClient.Failure()))) {
                $0.isLoading = false
                $0.products = []
            }
        )
    }
    
    func testProductsFavoriteTappedFlow() {
        let store = TestStore(
            initialState: .init(products: [.miniDress, .cashmereCardigan]),
            reducer: shopReducer,
            environment: .init(
                client: .empty,
                mainQueue: scheduler.eraseToAnyScheduler()
            )
        )
        
        store.assert(
            .send(.product(index: 0, action: .favoriteTapped)) {
                $0.products[0].isFavorite = true
                $0.products[1].isFavorite = false
            },
            .send(.product(index: 1, action: .favoriteTapped)) {
                $0.products[0].isFavorite = true
                $0.products[1].isFavorite = true
            },
            .send(.product(index: 0, action: .favoriteTapped)) {
                $0.products[0].isFavorite = false
                $0.products[1].isFavorite = true
            },
            .send(.product(index: 1, action: .favoriteTapped)) {
                $0.products[0].isFavorite = false
                $0.products[1].isFavorite = false
            }
        )
    }
}
