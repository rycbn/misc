import SwiftUI
import ComposableArchitecture
import SharedUI
import Shared

struct ProductRowView: View {
    let store: Store<Product, ProductAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack(alignment: .topTrailing) {
                NavigationLink(destination: ProductDetailView(store: store)) {
                    VStack(alignment: .leading) {
                        ProductImage(viewStore.images.url)
                        ProductName(viewStore.name)
                        Spacer()
                        Group {
                            ProductPrice(viewStore.price.totalAmount)
                            if !viewStore.badge.isEmpty {
                                ProductBadge(viewStore.badge)
                            }
                        }
                    }
                    .padding(.bottom)
                }
                .buttonStyle(PlainButtonStyle())
                
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
