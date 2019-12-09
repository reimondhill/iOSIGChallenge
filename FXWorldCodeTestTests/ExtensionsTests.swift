import XCTest
@testable import FXWorldCodeTest

class MockClass:NSObject{
}


class ExtensionsTests: XCTestCase {

    //MARK: - ArrayExtension
    func testSafeIndexInArray() {
        var array = [String]()
        array.append("Hello")
        
        XCTAssertEqual(array[safeIndex: 0], "Hello")
        XCTAssertNil(array[safeIndex: 1])
    }
    
    
    //MARK: - NSObjectExtension
    func testNSObjectLogClassName() {
        
        let mockClass = MockClass()
        XCTAssertEqual(mockClass.logClassName,"MockClass:")
        XCTAssertEqual(MockClass.logClassName,"MockClass:")
        
    }
    
    func testNSObjectIdentifier() {
        
        let mockClass = MockClass()
        XCTAssertEqual(mockClass.identifier, "MockClass")
        XCTAssertEqual(MockClass.identifier, "MockClass")
        
    }
    
    
    //MARK: - StringExtension

    
    //MARK: - UIStackViewExtension
    func testUIStackViewRemoveAll() {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        XCTAssertEqual(stackView.arrangedSubviews.count, 2)
        
        stackView.removeAllArrangedSubviews()
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
    }

    //MARK: - UIViewExtension
    func testUIViewParentViewController() {
        
        let viewController = UIViewController()
        let aView = UIView()
        viewController.view.addSubview(aView)
        
        XCTAssert(aView.viewControler != nil)
        XCTAssertEqual(aView.viewControler, viewController)
        
        XCTAssert(aView.findViewController() != nil)
        XCTAssertEqual(aView.findViewController(), viewController)
        
    }
    
}
