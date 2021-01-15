import SwiftUI
import ShopClient
import ProductDetail
import Product

public struct VanillaProductListView: View {
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
                    NavigationLink(destination: VanillaProductDetailView(product)) {
                        VanillaProductView(product)
                            .accessibility(label: Text(product.name))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.leading, 8)
            .padding([.top, .trailing], 16)
        }
    }
}

struct VanillaProductistView_Previews: PreviewProvider {
    static var previews: some View {
        VanillaProductListView([.miniDress, .cashmereCardigan])
    }
}
