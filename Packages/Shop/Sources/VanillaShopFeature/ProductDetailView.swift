import SwiftUI
import Product
import SharedUI

struct ProductDetailView: View {
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(product.images.urls, id: \.self) { url in
                        ProductImage(url)
                            .frame(width: 350)
                            .accessibility(label: Text(product.name + "image"))
                    }
                }
                .padding(.leading, 8)
                .padding([.top, .trailing], 16)
            }
            .padding(.bottom, 16)
            
            Group {
                ProductName(product.name)
                    .padding(.bottom, 2)
                
                ProductPrice(product.price.totalAmount)
                
                if !product.badge.isEmpty {
                    ProductBadge(product.badge)
                }
            }
            .padding(.leading, 16)
            
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(.miniDress)
    }
}
