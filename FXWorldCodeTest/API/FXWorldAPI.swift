import Foundation

let baseURL = URL(string: "https://content.dailyfx.com")!

enum Endpoint: String {
    case dashboard = "/api/v1/dashboard"
    case markets = "/api/v1/markets"
}

enum NetworkError: Error {
    case badURL
    case noData
    case decoding(Error)
    case unknown(Error?)
}

final class Network {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchModel<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<
        T, NetworkError>) -> Void) {
        
        guard let url = URL(string: endpoint.rawValue, relativeTo: baseURL) else {
            completion(.failure(.badURL))
            return
        }
        
        print("Fetching from: ", url.absoluteString)
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let model = try decoder.decode(T.self, from: jsonData)
                completion(.success(model))
            } catch let error {
                completion(.failure(.decoding(error)))
            }
        }.resume()
    }
}
