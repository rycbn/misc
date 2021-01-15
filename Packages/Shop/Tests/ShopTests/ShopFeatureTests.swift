import XCTest
@testable import ShopFeature

final class ShopFeatureTests: XCTestCase {

  func testViewModel_Fetch_ReturnCorrectValue() {
    let sut = ShopViewModel(client: .mock)
    
    XCTAssertTrue(sut.isLoading)

    sut.fetch()
    
    XCTAssertFalse(sut.isLoading)
    XCTAssertEqual(sut.products.count, 2)
    XCTAssertEqual(sut.products.first?.name, "Mini dress")
    XCTAssertEqual(sut.products.first?.badge, "In Stock")
  }
}
