import XCTest
@testable import VanillaShopFeature

final class VanillaShopFeatureTests: XCTestCase {
    
    func testViewModel_Fetch_ReturnCorrectValue() {
        let sut = ShopViewModel(client: .mock)
                
        sut.fetch()
        
        XCTAssertEqual(sut.products.count, 2)
        XCTAssertEqual(sut.products.first?.name, "Mini dress")
        XCTAssertEqual(sut.products.first?.badge, "In Stock")
    }
    
    func testViewModel_favoriteTapped() {
        let sut = ProductRowViewModel(product: .miniDress)
        
        XCTAssertFalse(sut.product.isFavorite)
        
        sut.favoriteTapped()
        
        XCTAssertTrue(sut.product.isFavorite)
    }
    
    func testViewModel_Subscript_ReturnCorrectValue() {
        let sut = ProductRowViewModel(product: .miniDress)
        
        XCTAssertEqual(sut.product.id, sut.id)
        XCTAssertEqual(sut.product.name, sut.name)
        XCTAssertEqual(sut.product.price, sut.price)
        XCTAssertEqual(sut.product.images, sut.images)
        XCTAssertEqual(sut.product.badges, sut.badges)
    }
}
