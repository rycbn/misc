import SwiftUI
import SharedUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geomery in
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 16){
                        ForEach(viewModel.images.urls, id: \.self) { url in
                            ProductImage(url)
                                .frame(width: geomery.size.width - 100)
                        }
                    }
                    .padding(16)
                }
                Group {
                    ProductName(viewModel.name)
                        .padding(.bottom, 2)
                    
                    ProductPrice(viewModel.price.totalAmount)
                    
                    if !viewModel.badge.isEmpty {
                        ProductBadge(viewModel.badge)
                    }
                }
                .padding(.leading, 16)
                Spacer()
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: .miniDress))
    }
}
