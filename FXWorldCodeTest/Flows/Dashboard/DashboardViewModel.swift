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
