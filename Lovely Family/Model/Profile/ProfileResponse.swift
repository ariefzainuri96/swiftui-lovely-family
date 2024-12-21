//
//  ProfileResponse.swift
//  Simart UMBY
//
//  Created by фкшуа on 12/12/24.
//

import Foundation

// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    var name, email, telepon, userName: String?
    var nis, nidn: String?
}
