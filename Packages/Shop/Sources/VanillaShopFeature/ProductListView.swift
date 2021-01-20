import SwiftUI
import Product

final class ProductListViewModel: ObservableObject {
    @Published var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product))) {
                        ProductRowView(viewModel: ProductRowViewModel(product: product))
                            .accessibility(label: Text(product.name))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.leading, 8)
            .padding([.top, .trailing], 16)
        }
    }
}

struct ProductistView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            viewModel: ProductListViewModel(
                products: [.miniDress, .cashmereCardigan]
            )
        )
    }
}
