//
//  LoginFormModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

struct LoginFormModel {
    var nis = ""
    var password = ""
    var isChecked: Bool = false
    
    func isLoginEnable() -> Bool {
        return !nis.isEmpty && !password.isEmpty
    }
}
