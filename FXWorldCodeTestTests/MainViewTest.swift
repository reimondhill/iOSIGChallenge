import XCTest
@testable import FXWorldCodeTest

class MainViewTest: XCTestCase {

    func testTitles() {
        let mainViewModel = MainViewModel(networkManager: MockNetwork())
        XCTAssertEqual(mainViewModel.numberOfTitle(), 2)
        XCTAssertEqual(mainViewModel.getTitle(for: 0), "Articles")
        XCTAssertEqual(mainViewModel.getTitle(for: 1), "Markets")
        XCTAssertNil(mainViewModel.getTitle(for: 2))
    }
}
