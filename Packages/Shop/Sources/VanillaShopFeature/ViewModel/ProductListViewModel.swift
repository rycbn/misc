import Foundation
import Product

final class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}
