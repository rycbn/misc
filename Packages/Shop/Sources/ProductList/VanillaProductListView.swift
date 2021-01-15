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
    
    @State private var isActive: Bool = false
    
    public var body: some View {
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
    }
}

struct VanillaProductistView_Previews: PreviewProvider {
    static var previews: some View {
        VanillaProductListView([.miniDress, .cashmereCardigan])
    }
}
