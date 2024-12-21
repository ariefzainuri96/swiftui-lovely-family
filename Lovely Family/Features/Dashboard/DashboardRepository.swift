//
//  DashboardRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 11/12/24.
//

protocol DashboardRepository {
    func getPengumuman() async throws -> PengumumanResponse
}

class DashboardRepositoryImpl: DashboardRepository {
    func getPengumuman() async throws -> PengumumanResponse {
        return try await HttpRequest.get(path: "/pengumuman")
    }
}
