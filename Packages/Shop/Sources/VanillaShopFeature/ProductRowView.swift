import SwiftUI
import SharedUI

struct ProductRowView: View {
    @ObservedObject var viewModel: ProductRowViewModel
    
    init(viewModel: ProductRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: viewModel.product))) {
                VStack(alignment: .leading) {
                    ProductImage(viewModel.images.url)
                    ProductName(viewModel.name)
                    Spacer()
                    ProductPrice(viewModel.price.totalAmount)
                    if !viewModel.badge.isEmpty {
                        ProductBadge(viewModel.badge)
                    }
                }
                .padding(.bottom)
            }
            .buttonStyle(PlainButtonStyle())

            ProductFavoriteButton(
                isFavorite: viewModel.isFavorite,
                action: viewModel.favoriteTapped
            )
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: ProductRowViewModel(product: .miniDress))
    }
}
