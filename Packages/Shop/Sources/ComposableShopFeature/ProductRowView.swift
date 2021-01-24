import SwiftUI
import ComposableArchitecture
import SharedUI
import Shared

struct ProductRowView: View {
    let store: Store<Product, ProductAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading) {
                    ProductImage(viewStore.images.url)
                        .accessibility(label: Text(viewStore.name + "image"))
                    ProductName(viewStore.name)
                    Spacer()
                    Group {
                        ProductPrice(viewStore.price.totalAmount)
                        if !viewStore.badge.isEmpty {
                            ProductBadge(viewStore.badge)
                        }
                    }
                }
                ProductFavoriteButton(isFavorite: viewStore.isFavorite) {
                    viewStore.send(.favoriteTapped)
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
