import Foundation

final class DashboardDataSource {
    private let network: Network
    private var allNews: AllNews?
    
    init(networkManager: Network = Network()) {
        self.network = networkManager
    }
    
    func loadDashboardData(forced: Bool = false, completion: @escaping (Result<AllNews, NetworkError>) -> Void) {
        if let news = allNews, !forced {
            completion(.success(news))
        }

        network.fetchDashboard { [weak self] result in
            guard let self = self else {
                completion(.failure(.unknown(nil)))
                return
            }
            
            if case Result.success(let downloadedNews) = result {
                self.allNews = downloadedNews
            }
            
            completion(result)
        }
    }
    
}

private extension Network {
    func fetchDashboard(completion: @escaping (Result<AllNews, NetworkError>) -> Void) {
        fetchModel(endpoint: .dashboard, completion: completion)
    }
}
