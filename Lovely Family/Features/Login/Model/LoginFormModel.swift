//
//  LoginFormModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import Foundation

struct LoginFormModel: Codable, EmptyFieldCheckable {
    var email = ""
    var password = ""
    
    func getData() -> Data {
        let data = try! JSONEncoder().encode(self)
        
        return data
    }
}
