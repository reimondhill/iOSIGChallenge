import Foundation


class MockNetwork: Network {
    func fetchModel<T>(endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        var localURL:URL!
        switch endpoint {
        case .dashboard:
            localURL = Bundle.main.url(forResource: "NewsResponse", withExtension: "json")
        case .markets:
            localURL = Bundle.main.url(forResource: "MarketsResponse", withExtension: "json")
        }
        
        do{
            let response = try JSONDecoder().decode(T.self, from: try Data(contentsOf: localURL))
            completion(.success(response))
        }
        catch {
            print("Error fetching data", error.localizedDescription)
            completion(.failure(NetworkError.noData))
        }
        
    }
}
