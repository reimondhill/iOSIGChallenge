import XCTest
@testable import FXWorldCodeTest

class MarketsViewTest: XCTestCase {
    
    let viewModel = MarketsViewModel(dataSource: MarketsDataSource(networkManager: MockNetwork()))
    
    override func setUp() {
        super.setUp()
        
        viewModel.fetchMarketsResponse()
    }
    
    func testNumberOfSectionsAndTitle() {
        XCTAssertEqual(viewModel.numberOfSections(), 3)
        
        XCTAssertEqual(viewModel.title(atSection: 0), "Currencies")
        XCTAssertEqual(viewModel.title(atSection: 1), "Commodities")
        XCTAssertEqual(viewModel.title(atSection: 2), "Indices")
    }
    
    func testNumberOfItemsInSection() {
        XCTAssertEqual(viewModel.numberOfItems(inSection: 0), 1)
        XCTAssertEqual(viewModel.numberOfItems(inSection: 1), 1)
        XCTAssertEqual(viewModel.numberOfItems(inSection: 2), 1)
    }
    
    func testItemAt() {
        let itemOne = viewModel.item(atSection: 0, row: 0)
        XCTAssertEqual(itemOne?.displayName, "EUR/USD")
        
        let itemTwo = viewModel.item(atSection: 1, row: 0)
        XCTAssertEqual(itemTwo?.displayName, "Spot Gold")
        
        let itemThree = viewModel.item(atSection: 2, row: 0)
        XCTAssertEqual(itemThree?.displayName, "USDOLLAR")
    }
    
}
