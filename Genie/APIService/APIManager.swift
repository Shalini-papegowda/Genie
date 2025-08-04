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
    let jsonDecoder: JSONDecoder
    let logger: Logging
    
    init(urlSession: URLSession = URLSession.shared,
         endpoint: APIEnvironment = .dev,
         logger: Logging = LogManager(),
         jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.endpoint = endpoint
        self.logger = logger
        self.jsonDecoder = jsonDecoder
    }
    
    func request<T: Decodable>(from request: APIRequest<T>) async throws -> T {
        let urlRequest = try request.getURLRequest(from: endpoint)
        do {
            let (data, response) = try await urlSession.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                logger.error("Invalid response received.")
                throw APIError.networkError(statusCode: -1, data: data)
            }
            logger.info("Response received with status: \(httpResponse.statusCode)")
            
            guard (200...299).contains(httpResponse.statusCode) else {
                logger.error("Request failed with status code: \(httpResponse.statusCode)")
                throw APIError.networkError(statusCode: httpResponse.statusCode, data: data)
            }
            
            let decoded = try jsonDecoder.decode(T.self, from: data)
            logger.debug("Successfully decoded response: \(decoded)")
            
            return decoded
        } catch let error as DecodingError {
            logger.error("Decoding failed: \(error)")
            throw APIError.decodingFailed(error)
        } catch {
            logger.error("Unknown error: \(error)")
            throw APIError.unknown(error)
        }
    }
}
