import XCTest
@testable import Shared

final class SharedTests: XCTestCase {
    
    func testSummaryResponse_Decode_ReturnCorrectValue() {
        let bundle = Bundle(for: type(of: self))
        let filename = "summary.json"

        do {
            let sut = try bundle.decode(SummaryResponse.self, from: filename)
            XCTAssertEqual(sut.summaries.count, 1)
            XCTAssertEqual(sut.summaries.first?.name, "Mini dress")
            XCTAssertEqual(sut.summaries.first?.price.totalAmount, "GBP 595")
            XCTAssertEqual(sut.summaries.first?.images.url?.absoluteString, "https://cache.net-a-porter.com/images/products/1317866/1317866_in_dl.jpg")
        } catch {
            XCTFail("Failed to decode \(filename), error \(error.localizedDescription)")
        }
    }
}
