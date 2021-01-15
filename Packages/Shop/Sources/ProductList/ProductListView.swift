import SwiftUI
import ShopClient
import ProductDetail
import Product

public struct ProductListView: View {
    public let products: [Product]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ products: [Product]) {
        self.products = products
    }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink(destination: ProductDetailView(product)) {
                        ProductView(product)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.leading, 8)
            .padding([.top, .trailing], 16)
        }
    }
}

struct ProductistView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView([.miniDress, .cashmereCardigan])
    }
}
