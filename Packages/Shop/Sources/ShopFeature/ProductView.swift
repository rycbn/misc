import SwiftUI
import Kingfisher
import ShopClient

struct ProductView: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(product.images.url)
                .placeholder {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            Text(product.name)
            Spacer()
            Text(product.price.totalAmount)
                .fontWeight(.bold)
            if !product.badge.isEmpty {
                Text(product.badge)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.leading, 8)
        .padding(.bottom, 16)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
            product: .miniDress
        )
    }
}
