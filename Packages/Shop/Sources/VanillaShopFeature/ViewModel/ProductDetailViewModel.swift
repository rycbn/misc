import Foundation
import Product

@dynamicMemberLookup
final class ProductDetailViewModel: ObservableObject {
    @Published private(set) var product: Product
    
    init(product: Product) {
        self.product = product
    }

    subscript<T>(dynamicMember keyPath: KeyPath<Product, T>) -> T {
        product[keyPath: keyPath]
    }
}
