import SwiftUI
import ShopClient
import SharedUI

public struct ProductView: View {
    public let product: Product
    
    public init(_ product: Product) {
        self.product = product
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ProductImage(product.images.url)
            Text(product.name)
                .padding(.leading, 8)
            Spacer()
            Group {
                Text(product.price.totalAmount)
                    .fontWeight(.bold)
                if !product.badge.isEmpty {
                    Text(product.badge)
                        .foregroundColor(.secondary)
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
