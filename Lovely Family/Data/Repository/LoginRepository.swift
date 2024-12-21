//
//  LoginRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 10/12/24.
//

import Foundation

protocol LoginRepository {
    func login(username: String, password: String) async throws -> LoginResponse
}

class LoginRepositoryImpl: LoginRepository {
    func login(username: String, password: String) async throws -> LoginResponse {
        return try await HttpRequest.get(path: "/login")
    }
}
