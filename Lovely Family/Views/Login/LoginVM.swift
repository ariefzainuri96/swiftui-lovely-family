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
    var errorLoginForm: [FormErrorModel] = []
    var isObsecure = true
    
    func login(appState: AppState) async {
        if loginState == RequestState.LOADING { return }
            
        errorLoginForm = loginForm.emptyFields
        
        // stop the process and show the error in view
        if !errorLoginForm.isEmpty {
            return
        }
        
        loginState = RequestState.LOADING
        
        await performNetworkingTask(
            task: {
                try await loginRepo.login(data: loginForm.getData())
            },
            onSuccess: { data in
                loginState = RequestState.SUCCESS
                
                UserDefaults.standard.set(true, forKey: UserDefaultsKey.IS_LOGIN)
                
                print("sukses login")
                
                appState.isLogin = true
            },
            onFailure: { error in                
                loginState = RequestState.ERROR
                print("Error: \(error)")
            }
        )
    }
}
