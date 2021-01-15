import SwiftUI
import SharedUI
import ProductList

public struct VanillaShopView: View {
    @ObservedObject var viewModel: ShopViewModel
    
    public init(viewModel: ShopViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        if viewModel.isLoading {
            ActivityIndicator()
                .onAppear(perform: fetch)
        } else {
            VanillaProductListView(viewModel.products)
        }
    }
    
    private func fetch() {
        viewModel.fetch()
    }
}

struct VanillaShopView_Previews: PreviewProvider {
    static var previews: some View {
        VanillaShopView(
            viewModel: ShopViewModel(client: .mock)
        )
    }
}
