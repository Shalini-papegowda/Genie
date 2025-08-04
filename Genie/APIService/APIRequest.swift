//
//  Request.swift
//  Genie
//
//  Created by Shalini K P on 01/08/2025.
//

import Foundation

struct APIRequest<T: Decodable> {
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Encodable?
    let queryParameters: [URLQueryItem]?
    
    init(path: String,
         method: HTTPMethod = .get,
         headers: [String: String]? = nil,
         body: Encodable? = nil,
         queryParameters: [URLQueryItem]? = nil) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.queryParameters = queryParameters
    }
    
    func getURLRequest(from endpoint: APIEnvironment, encoder: JSONEncoder = JSONEncoder()) throws -> URLRequest {
        guard let endpointURL = endpoint.getEndpointURL(path: path, queryParam: queryParameters) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = method.rawValue
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        do {
            if let body = body, method != .get {
                request.httpBody = try encoder.encode(body)
                if request.value(forHTTPHeaderField: "Content-Type") == nil {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
            }
        } catch {
            throw APIError.encodingFailed(error)
        }
        return request
    }
}
