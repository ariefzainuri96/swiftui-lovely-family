//
//  LoginFormModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import Foundation

struct LoginFormModel: Codable {
    var email = ""
    var password = ""
    var isChecked: Bool = false
    
    // Exclude `isChecked` from encoding
    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
    
    func isLoginEnable() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func getData() -> Data {
        let data = try! JSONEncoder().encode(self)
        
        return data
    }
}
