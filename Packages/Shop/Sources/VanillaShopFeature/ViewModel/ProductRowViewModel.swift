import Foundation
import Product

@dynamicMemberLookup
final class ProductRowViewModel: ObservableObject {
    @Published private(set) var product: Product
    
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
