//
//  LoginRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 10/12/24.
//

import Foundation

protocol LoginRepository {
    func login(data: Data) async throws -> LoginResponse
}

class LoginRepositoryImpl: LoginRepository {
    func login(data: Data) async throws -> LoginResponse {
        return try await HttpRequest.post(path: "/users/login", body: data)
    }
}
