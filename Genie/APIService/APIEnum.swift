//
//  APIEnum.swift
//  Genie
//
//  Created by Shalini K P on 02/08/2025.
//

import Foundation

enum APIEnvironment {
    case dev
    case prod
    
    var baseURL: URL? {
        switch self {
        case .dev:
            return URL(string: "https://api-dev.example.com")
        case .prod:
            return URL(string: "https://api.example.com")
        }
    }
    
    func getEndpointURL(path: String, queryParam: [URLQueryItem]?) -> URL? {
        guard let baseURL = baseURL,
              var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        else { return nil }
        components.queryItems = queryParam
        return components.url
    }
}

enum APIError: Error {
    case invalidURL
    case unknown(Error)
    case encodingFailed(Error)
    case decodingFailed(Error)
    case networkError(Error)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
