
import XCTest

class FXWorldCodeTestUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        print("Hello from setup")
        continueAfterFailure = true
        
        app = XCUIApplication()
        //Uncomment next line to use MOCKNetwork for the app
        app.launchArguments = ["TEST"]
        app.launch()
        
    }
    
    func testMainSelectors() {
        let segmentElement = app.segmentedControls.firstMatch
        XCTAssertTrue(segmentElement.buttons["Articles"].exists)
        XCTAssertTrue(segmentElement.buttons["Markets"].exists)
    }
    
    func testCheckDasboardData() {
        let scrollElement = app.scrollViews.firstMatch
        let button = scrollElement.buttons["Dow Jones, S&P 500 Short-term Volatility Features Chart Pattern"].firstMatch
        XCTAssertTrue(button.waitForExistence(timeout: 5))
        button.tap()
        XCTAssertTrue(app.webViews.firstMatch.waitForExistence(timeout: 5))
    }
    
    func testCheckMarketsData() {
        let segmentElement = app.segmentedControls.firstMatch
        segmentElement.buttons["Markets"].tap()
        
        let elementOne = app.tables.firstMatch.cells.element(boundBy: 0).staticTexts["EUR/USD"]
        XCTAssertTrue(elementOne.waitForExistence(timeout: 5))
        
        let elementTwo = app.tables.firstMatch.cells.element(boundBy: 1).staticTexts["Spot Gold"]
        XCTAssertTrue(elementTwo.waitForExistence(timeout: 5))
        
        let elementThree = app.tables.firstMatch.cells.element(boundBy: 2).staticTexts["USDOLLAR"]
        XCTAssertTrue(elementThree.waitForExistence(timeout: 5))
    }
    
}
