import SwiftUI
import ShopClient

struct ProductListView: View {
    let products: [Product]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    ProductView(product: product)
                }
            }
            .padding(.leading, 8)
            .padding(.trailing, 16)
        }
    }
}

struct ProductistView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: [.miniDress, .cashmereCardigan])
    }
}
