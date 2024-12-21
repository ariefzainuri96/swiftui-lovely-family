//
//  PengumumanResponse.swift
//  Simart UMBY
//
//  Created by фкшуа on 11/12/24.
//

import Foundation

// MARK: - PengumumanResponse
struct PengumumanResponse: Codable {
    let status: Int?
    let message: String?
    let data: [PengumumanData]?
}

// MARK: - PengumumanData
struct PengumumanData: Codable {
    let id: Int?
    let title, date, pengumuman: String?
}
