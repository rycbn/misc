import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 16, alignment: .center)]
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                ForEach(viewModel.products) { product in
                    ProductRowView(
                        viewModel: ProductRowViewModel(product: product)
                    )
                    .accessibility(label: Text(product.name))
                }
            }
            .padding(16)
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
