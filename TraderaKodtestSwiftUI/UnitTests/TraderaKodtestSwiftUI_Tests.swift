@testable import TraderaKodtestSwiftUI
import XCTest

final class TraderaKodtestSwiftUI_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeartView_toggleFavorite_shouldToggleIsFilled() {
        let sut = HeartView(isFavorite: true, heartAction: {})
        
        sut.heartAction()
        
        XCTAssertEqual(sut.isFilled, true)
    }
    
    func testDataManager_toggleFavorite_shouldAddProductToFavorites() {
        let sut = DataManager()
        let product = ProductJSON(
            id: 1,
            title: "Test Product",
            price: 299,
            currency: .sek,
            image: "https://example.com/image.jpg"
        )
        
        sut.toggleFavorite(product)
        
        XCTAssertEqual(sut.favorites.count, 1)
        XCTAssertEqual(sut.favorites.first?.id, 1)
    }

}
