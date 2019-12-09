import XCTest
@testable import FXWorldCodeTest

class DashboardViewTest: XCTestCase {

    let viewModel = DashboardViewModel(dashboardDataSource: DashboardDataSource(networkManager: MockNetwork()))
    
    override func setUp() {
        super.setUp()
        
        viewModel.fetchAllArticles()
    }
    
    func testGetAllArticlesFirstCorrect() {
        let articles = viewModel.getAllArticles()
        
        let firstArticle = articles.first!
        XCTAssertEqual(firstArticle.title, "Dow Jones, S&P 500 Short-term Volatility Features Chart Pattern")
        XCTAssertEqual(firstArticle.url, "https://www.dailyfx.com/forex/technical/home/analysis/spx500/2019/12/09/Dow-Jones-SP-500-Short-term-Volatility-Features-Chart-Patterns-PRtech.html")
    }
    
    func testGetArticleURL() {
        XCTAssertEqual(viewModel.getArticleURL(at: 0), URL(string: "https://www.dailyfx.com/forex/technical/home/analysis/spx500/2019/12/09/Dow-Jones-SP-500-Short-term-Volatility-Features-Chart-Patterns-PRtech.html"))
    }

}
