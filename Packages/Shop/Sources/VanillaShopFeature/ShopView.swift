import SwiftUI
import SharedUI

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
                ProductListView(viewModel.products)
            }
            .navigationTitle(Text("Shop"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        guard viewModel.products.isEmpty else { return }
        print("=====> viewModel.fetch")
        viewModel.fetch()
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(
            viewModel: ShopViewModel(client: .live)
        )
    }
}
