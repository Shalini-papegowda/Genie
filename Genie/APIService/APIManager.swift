//
//  APIService.swift
//  Genie
//
//  Created by Shalini K P on 29/07/2025.
//

import Foundation

protocol APIClient {
    func request<T: Decodable>(from request: APIRequest<T>) async throws -> T
}

class APIManager: APIClient {
    let endpoint: APIEnvironment
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared, endpoint: APIEnvironment = .dev) {
        self.urlSession = urlSession
        self.endpoint = endpoint
    }
    
    func request<T>(from request: APIRequest<T>) async throws -> T where T : Decodable {
        let urlRequest = try request.getURLRequest(from: endpoint)
        do {
            let (data, response) = try await urlSession.data(for: urlRequest)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.networkError(NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? -1))
            }
            
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch let error as DecodingError {
            throw APIError.decodingFailed(error)
        } catch  {
            throw APIError.unknown(error)
        }
    }
}
