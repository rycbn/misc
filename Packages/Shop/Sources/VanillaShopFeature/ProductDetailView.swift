import SwiftUI
import Product
import SharedUI


@dynamicMemberLookup
final class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }

    subscript<T>(dynamicMember keyPath: KeyPath<Product, T>) -> T {
        product[keyPath: keyPath]
    }
}

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.images.urls, id: \.self) { url in
                        ProductImage(url)
                            .frame(width: 350)
                            .accessibility(label: Text(viewModel.name + "image"))
                    }
                }
                .padding(.leading, 8)
                .padding([.top, .trailing], 16)
            }
            .padding(.bottom, 16)
            
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

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: .miniDress))
    }
}
