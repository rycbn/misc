import SwiftUI
import SharedUI
import Product

@dynamicMemberLookup
final class ProductRowViewModel: ObservableObject {
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func favoriteTapped() {
        product.isFavorite.toggle()
    }
    
    subscript<T>(dynamicMember keyPath: KeyPath<Product, T>) -> T {
        product[keyPath: keyPath]
    }
}

struct ProductRowView: View {
    @ObservedObject var viewModel: ProductRowViewModel
    
    init(viewModel: ProductRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                ProductImage(viewModel.images.url)
                    .accessibility(label: Text(viewModel.name + "image"))
                
                ProductName(viewModel.name)
                    .padding(.leading, 8)
                
                Spacer()
                
                Group {
                    ProductPrice(viewModel.price.totalAmount)
                    
                    if !viewModel.badge.isEmpty {
                        ProductBadge(viewModel.badge)
                    }
                }
                .padding(.leading, 8)
            }
            .padding(.bottom, 16)
            
            Button(action: { viewModel.favoriteTapped() }) {
                ProductFavorite(isFavorite: viewModel.isFavorite)
            }
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: ProductRowViewModel(product: .miniDress))
    }
}
