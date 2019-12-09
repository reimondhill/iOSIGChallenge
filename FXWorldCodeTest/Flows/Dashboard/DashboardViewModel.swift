import Foundation

protocol DashboardDelegate: class {
    func didReceiveError(message: String)
    func didUpdateArticles()
}

final class DashboardViewModel {
    enum DashboardSection: CaseIterable {
        case topNews, dailyBriefings, technicalAnalysis, specialReport
    }
    
    weak var coordinator: FXWorldCoordinator!
    weak var delegate: DashboardDelegate?
    
    private var news: AllNews?
    private let dataSource: DashboardDataSource
    
    init(dashboardDataSource: DashboardDataSource) {
        self.dataSource = dashboardDataSource
    }
}

extension DashboardViewModel {
    var allSections: [DashboardSection] { DashboardSection.allCases }
    
    func articles(for section: DashboardSection) -> [Article] {
        guard let news = news else {
            fetchAllArticles()
            return []
        }
        
        switch section {
        case .topNews: return news.topNews
        case .dailyBriefings: return []
        case .technicalAnalysis: return news.topNews
        case .specialReport: return news.specialReport
        }
    }
    
    /// Returns topNews, technicalAnalysis and specialReport Articles from AllNewsResponse
    func getAllArticles() -> [Article] {
        guard let news = news else {
            return []
        }
        var articles: [Article] = []
        
        articles.append(contentsOf: news.topNews)
        articles.append(contentsOf: news.technicalAnalysis)
        articles.append(contentsOf: news.specialReport)
        
        return articles
    }
    
    /// From getAllArticles() returns the URL for an specific article
    func getArticleURL(at index: Int) -> URL? {
        return URL(string: getAllArticles()[safeIndex: index]?.url ?? "")
    }
    
    /// Returns all the daily briefings from news response
    func getDailyBriefings() -> DailyBriefings? {
        guard let news = news else {
            return nil
        }
        
        return news.dailyBriefings
    }
    
    func fetchAllArticles() {
        dataSource.loadDashboardData { [weak self] result in
            switch result {
            case .success(let dashboardData):
                self?.news = dashboardData
                self?.delegate?.didUpdateArticles()
                
            case .failure(let error):
                self?.delegate?.didReceiveError(message: error.localizedDescription)
            }
        }
    }
    
}
