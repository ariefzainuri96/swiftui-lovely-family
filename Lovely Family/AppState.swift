//
//  AppState.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception
import Foundation

@Perceptible class AppState {
    var isLogin = false
    
    func checkLoginState() {
        let defaults = UserDefaults.standard
        print("isLogin -> \(defaults.bool(forKey: UserDefaultsKey.IS_LOGIN))")
        isLogin = defaults.bool(forKey: UserDefaultsKey.IS_LOGIN)
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: UserDefaultsKey.IS_LOGIN)
        
        isLogin.toggle()
    }
    
    init() {
        checkLoginState()
    }
}
