import SwiftUI
import ShopClient
import SharedUI

public struct ProductDetailView: View {
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
                    }
                }
                .padding(.leading, 8)
                .padding([.top, .trailing], 16)
            }
            .padding(.bottom, 16)
            
            Group {
                Text(product.name)
                    .padding(.bottom, 2)
                Text(product.price.totalAmount)
                    .fontWeight(.bold)
                if !product.badge.isEmpty {
                    Text(product.badge)
                        .foregroundColor(.secondary)
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
