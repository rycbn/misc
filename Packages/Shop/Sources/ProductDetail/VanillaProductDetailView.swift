import SwiftUI
import ShopClient
import SharedUI

public struct VanillaProductDetailView: View {
    public let product: Product
    
    public init(_ product: Product) {
        self.product = product
    }
    
    public var body: some View {
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
                Text(product.name)
                    .accessibility(label: Text(product.name))
                    .padding(.bottom, 2)
                
                Text(product.price.totalAmount)
                    .fontWeight(.bold)
                    .accessibility(label: Text(product.name + "total amount \(product.price.totalAmount)"))
                
                if !product.badge.isEmpty {
                    Text(product.badge)
                        .foregroundColor(.secondary)
                        .accessibility(label: Text(product.name + product.badge))
                }
            }
            .padding(.leading, 16)
            
            Spacer()
        }
    }
}

struct VanillaProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VanillaProductDetailView(.miniDress)
    }
}
