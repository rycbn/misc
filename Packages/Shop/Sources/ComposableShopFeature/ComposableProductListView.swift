import SwiftUI
import ComposableArchitecture
import Product
import ProductDetail

public struct ComposableProductListView: View {
//    public let store: Store<ShopState, ShopAction>
//
//    public init(store: Store<ShopState, ShopAction>) {
//        self.store = store
//    }
    public let products: [Product]

    public init(_ products: [Product]) {
        self.products = products
    }

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var isActive: Bool = false

    public var body: some View {
//        WithViewStore(store) { viewStore in
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        Button(action: { isActive = true }) {
                            NavigationLink(destination: VanillaProductDetailView(product), isActive: $isActive) {
                                VanillaProductView(product)
                                    .accessibility(label: Text(product.name))
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 8)
                .padding([.top, .trailing], 16)
            }
//        }
    }
}

//struct ComposableProductListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComposableProductListView(
//            store: Store(
//                initialState: .init(
//                    products: [.miniDress, .cashmereCardigan],
//                    isActive: false
//                ),
//                reducer: .empty,
//                environment: { }
//            )
//        )
//    }
//}
