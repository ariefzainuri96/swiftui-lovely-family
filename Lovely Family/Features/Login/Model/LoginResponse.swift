//
//  LoginResponse.swift
//  Simart UMBY
//
//  Created by фкшуа on 10/12/24.
//
//  To parse the JSON, add this file to your project and do:
//
//  let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let status: Int?
    let message: String?
    let data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    let id: Int?
    let name, email: String?
}
