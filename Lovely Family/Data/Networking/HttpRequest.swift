//
//  HttpRequest.swift
//  Simart UMBY
//
//  Created by фкшуа on 10/12/24.
//

import Foundation

class HttpRequest {
    static func get<T: Codable>(path: String) async throws -> T {
        let endpoint = "\(Constant.BASE_URL)\(path)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.INVALID_URL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        NetworkLogger.log(response: response as? HTTPURLResponse, data: data, error: nil)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.INVALID_RESPONSE
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkingError.INVALID_DATA
        }
    }
    
    static func post<T: Codable>(path: String, body: Data, boundary: String = "", isFormData: Bool = false) async throws -> T {
        let endpoint = "\(Constant.BASE_URL)\(path)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.INVALID_URL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        if isFormData {
            request.setValue(
                "multipart/form-data; boundary=\(boundary)",
                forHTTPHeaderField: "Content-Type"
            )
        }
        
        NetworkLogger.log(request: request)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        NetworkLogger.log(response: response as? HTTPURLResponse, data: data, error: nil)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.INVALID_RESPONSE
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkingError.INVALID_DATA
        }
    }
}
