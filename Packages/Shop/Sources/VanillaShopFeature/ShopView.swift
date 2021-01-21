import SwiftUI
import SharedUI
import Product

public struct ShopView: View {
    @ObservedObject var viewModel: ShopViewModel
    
    public init(viewModel: ShopViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ActivityIndicator()
                        .frame(maxWidth: .infinity)
                }
                ProductListView(
                    viewModel: ProductListViewModel(
                        products: viewModel.isLoading ? Product.placeholder : viewModel.products
                    )
                )
                .redacted(reason: viewModel.isLoading ? .placeholder : [])
            }
            .navigationTitle(Text("Shop"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        guard viewModel.products.isEmpty else { return }
        viewModel.fetch()
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(
            viewModel: ShopViewModel(client: .mock)
        )
    }
}
