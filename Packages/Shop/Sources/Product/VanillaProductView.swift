import SwiftUI
import ShopClient
import SharedUI

public struct VanillaProductView: View {
    public let product: Product
    
    public init(_ product: Product) {
        self.product = product
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ProductImage(product.images.url)
                .accessibility(label: Text(product.name + "image"))
            
            Text(product.name)
                .accessibility(label: Text(product.name))
                .padding(.leading, 8)
            
            Spacer()
            Group {
                Text(product.price.totalAmount)
                    .fontWeight(.bold)
                    .accessibility(label: Text(product.name + "total price \(product.price.totalAmount)"))
                
                if !product.badge.isEmpty {
                    Text(product.badge)
                        .foregroundColor(.secondary)
                        .accessibility(label: Text(product.name + product.badge))
                }
            }
            .padding(.leading, 8)
        }
        .padding(.bottom, 16)
    }
}

struct VanillaProductView_Previews: PreviewProvider {
    static var previews: some View {
        VanillaProductView(.miniDress)
    }
}
