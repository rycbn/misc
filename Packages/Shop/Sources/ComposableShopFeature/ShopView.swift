import SwiftUI
import ComposableArchitecture
import Product
import SharedUI

public struct ShopState: Equatable {
    public var products: [Product] = []
    public var isLoading: Bool = false
    public var product: Product?
    
    public init() {}

    var url: URL? {
        URL(string: "https://api.net-a-porter.com/NAP/GB/en/300/0/summaries")
    }
}

public enum ShopAction {
    case onAppear
    case response(Result<[Product], Error>)
    case product(index: Int, action: ProductAction)
}

public struct ShopEnvironment {
    public let client: ComposableShopClient
    public let mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(client: ComposableShopClient, mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.client = client
        self.mainQueue = mainQueue
    }
}

public let shopReducer = Reducer<ShopState, ShopAction, ShopEnvironment>.combine(
    .init { state, action, environment in
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
)

public struct ShopView: View {
    public let store: Store<ShopState, ShopAction>
    
    public init(store: Store<ShopState, ShopAction>) {
        self.store = store
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack {
                    if viewStore.isLoading {
                        ActivityIndicator()
                            .frame(maxWidth: .infinity)
                    }
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ProductListView(store: store)
                        }
                        .padding(.leading, 8)
                        .padding([.top, .trailing], 16)
                    }
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

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(
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