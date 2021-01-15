import SwiftUI
import SharedUI

public struct ShopView: View {
    @ObservedObject var viewModel: ShopViewModel
    
    public init(viewModel: ShopViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        if viewModel.isLoading {
            ActivityIndicator()
                .onAppear(perform: fetch)
        } else {
            ProductListView(products: viewModel.products)
            .onAppear(perform: fetch)
        }
    }
    
    private func fetch() {
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
