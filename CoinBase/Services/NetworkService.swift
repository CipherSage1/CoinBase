//
//  NetworkService.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private let baseURL: String
    private let session: URLSession
    
    init(baseURL: String = "https://api.coinranking.com/v2", session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func createUrl(endpoint: String,  method: NetworkMethods, parameters: [String: Any]? = nil)-> URL? {
         
        let urlString = baseURL + endpoint
        var components = URLComponents(string: urlString)
        
        //check if the method is a get method and append the query parameters
        if method.rawValue == "GET", let parameters = parameters {
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        return components?.url
    }
    
    func makeRequest<T: Decodable>(endpoint: String, method: NetworkMethods, parameters: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = createUrl(endpoint: endpoint, method: method, parameters: parameters) else {
            return completion(.failure(NetworkError.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(NetworkError.serverError(httpResponse.statusCode)))
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(NetworkError.decodingError(error)))
            }
            
        }.resume()
        
    }
    
}
