//
//  ProfileRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import Foundation

protocol ProfileRepository {
    func getProfile() async throws -> ProfileResponse?
}

class ProfileRepositoryImpl: ProfileRepository {
    func getProfile() async throws -> ProfileResponse? {
        return try await HttpRequest.get(path: "/profile")
    }
}
