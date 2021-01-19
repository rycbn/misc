import SwiftUI
import ComposableArchitecture
import SharedUI
import Product

struct ProductRowView: View {
    let store: Store<Product, ProductAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                ProductImage(viewStore.images.url)
                    .accessibility(label: Text(viewStore.name + "image"))

                ProductName(viewStore.name)
                    .padding(.leading, 8)

                Spacer()

                Group {
                    ProductPrice(viewStore.price.totalAmount)

                    if !viewStore.badge.isEmpty {
                        ProductBadge(viewStore.badge)
                    }
                }
                .padding(.leading, 8)
            }
            .padding(.bottom, 16)
            .onAppear {
                withAnimation(.easeInOut(duration: 3.0)) {
                    viewStore.send(.onAppear)
                }
            }
        }
    }
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(
            store: Store(
                initialState: Product.miniDress,
                reducer: .empty,
                environment: ()
            )
        )
    }
}
