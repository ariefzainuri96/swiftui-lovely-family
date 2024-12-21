//
//  LoginVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import Perception
import Foundation

@Perceptible class LoginVM {
    let loginRepo = LoginRepositoryImpl()
    
    var loginState = RequestState.IDLE
    var loginForm: LoginFormModel = LoginFormModel()
    
    func login(appState: AppState) async {
        loginState = RequestState.LOADING

        await delay(second: 1)
        
        await performNetworkingTask(
            task: {
                try await loginRepo.login(username: loginForm.nis, password: loginForm.password)
            },
            onSuccess: { data in
                loginState = RequestState.SUCCESS
                
                UserDefaults.standard.set(true, forKey: UserDefaultsKey.IS_LOGIN)
                
                appState.isLogin = !appState.isLogin
            },
            onFailure: { error in
                loginState = RequestState.ERROR
            }
        )
    }
}
