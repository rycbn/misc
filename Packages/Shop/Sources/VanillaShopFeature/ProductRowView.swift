import SwiftUI
import SharedUI
import Product

struct ProductRowView: View {
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
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

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(.miniDress)
    }
}
