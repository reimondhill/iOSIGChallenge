import Foundation

final class MarketsDataSource {
    private let network: Network
    private var marketsResponse: MarketsResponse?
    
    init(networkManager: Network = Network()) {
        self.network = networkManager
    }
    
    func loadMarketsdData(forced: Bool = false, completion: @escaping (Result<MarketsResponse, NetworkError>) -> Void) {
        if let marketsResponse = marketsResponse, !forced {
            completion(.success(marketsResponse))
        }

        network.fetchMarkets { [weak self] result in
            guard let self = self else {
                completion(.failure(.unknown(nil)))
                return
            }
            
            if case Result.success(let downloadedMarketsResponse) = result {
                self.marketsResponse = downloadedMarketsResponse
            }
            
            completion(result)
        }
    }
    
}

extension Network {
    func fetchMarkets(completion: @escaping (Result<MarketsResponse, NetworkError>) -> Void) {
        fetchModel(endpoint: .markets, completion: completion)
    }
}
