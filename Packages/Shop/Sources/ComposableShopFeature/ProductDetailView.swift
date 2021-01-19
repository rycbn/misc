import SwiftUI
import ComposableArchitecture
import SharedUI
import Product

struct ProductDetailView: View {
    let store: Store<Product, ProductAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewStore.images.urls, id: \.self) { url in
                            ProductImage(url)
                                .frame(width: 350)
                                .accessibility(label: Text(viewStore.name + "image"))
                        }
                    }
                    .padding(.leading, 8)
                    .padding([.top, .trailing], 16)
                }
                .padding(.bottom, 16)
                
                Group {
                    ProductName(viewStore.name)
                        .padding(.bottom, 2)
                    
                    ProductPrice(viewStore.price.totalAmount)
                    
                    if !viewStore.badge.isEmpty {
                        ProductBadge(viewStore.badge)
                    }
                }
                .padding(.leading, 16)
                
                Spacer()
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            store: Store(
                initialState: Product.miniDress,
                reducer: .empty,
                environment: { }
            )
        )
    }
}
