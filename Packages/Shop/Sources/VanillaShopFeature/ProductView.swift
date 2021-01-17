import SwiftUI
import SharedUI
import Product

public struct ProductView: View {
    public let product: Product
    
    public init(_ product: Product) {
        self.product = product
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ProductImage(product.images.url)
                .accessibility(label: Text(product.name + "image"))
            
            ProductName(product.name)
                .padding(.leading, 8)
            
            Spacer()
            
            Group {
                ProductPrice(product.price.totalAmount)
                
                if !product.badge.isEmpty {
                    ProductBadge(product.badge)
                }
            }
            .padding(.leading, 8)
        }
        .padding(.bottom, 16)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(.miniDress)
    }
}
