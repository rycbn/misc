import SwiftUI
import ComposableArchitecture
import Shared

struct ProductListView: View {
    public let store: Store<ShopState, ShopAction>
    
    public init(store: Store<ShopState, ShopAction>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(store) { viewStore in
            ForEachStore(store.scope(state: \.products, action: ShopAction.product)) { productStore in
                NavigationLink(destination: ProductDetailView(store: productStore)) {
                    ProductRowView(store: productStore)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var shopState: ShopState {
        var state = ShopState()
        state.products = [.miniDress, .cashmereCardigan]
        return state
    }
    
    static var previews: some View {
        
        ProductListView(
            store: Store(
                initialState: shopState,
                reducer: .empty,
                environment: ()
            )
        )
    }
}
