import SwiftUI
import ComposableArchitecture
import Product
import SharedUI

public struct ShopState: Equatable {
    public var products: [Product] = []
    public var isLoading: Bool = false
    
    public init() {}
    
    public var url: URL? {
        URL(string: "https://api.net-a-porter.com/NAP/GB/en/300/0/summaries")
    }
}

public enum ShopAction {
    case onAppear
    case product(index: Int, action: ProductAction)
    case response(Result<[Product], Error>)
}

public struct ShopEnvironment {
    public let client: ComposableShopClient
    public let mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(client: ComposableShopClient, mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.client = client
        self.mainQueue = mainQueue
    }
}

public let shopReducer = Reducer<ShopState, ShopAction, ShopEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        print("=====> shopReducer onAppear")
        state.isLoading = true
        struct ShopID: Hashable {}
        guard let url = state.url else { return .none }
        return environment
            .client
            .summary(url)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(ShopAction.response)
            .cancellable(id: ShopID())
        
    case .response(.failure):
        state.isLoading = false
        state.products = []
    
    case let .response(.success(products)):
        state.isLoading = false
        state.products = products
        
    case let .product(index, action: .onAppear):
        state.products[index].isLoaded = true
    }
    
    return .none
}

public struct ComposableShopView: View {
    public let store: Store<ShopState, ShopAction>
    
    public init(store: Store<ShopState, ShopAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack {
                    if viewStore.isLoading {
                        ActivityIndicator()
                            .frame(maxWidth: .infinity)
                    }
                    VanillaProductListView(viewStore.products)
                }
                .navigationTitle(Text("Shop"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                if viewStore.products.isEmpty {
                    viewStore.send(.onAppear)
                }
            }
        }
    }
}

struct ComposableShopView_Previews: PreviewProvider {
    static var previews: some View {
        ComposableShopView(
            store: Store(
                initialState: .init(),
                reducer: shopReducer,
                environment: .init(
                    client: .mock,
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}
