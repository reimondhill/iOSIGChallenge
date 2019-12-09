import Foundation

extension Network {
    func fetchMarkets(completion: @escaping (Result<MarketsResponse, NetworkError>) -> Void) {
        fetchModel(endpoint: .markets, completion: completion)
    }
}
