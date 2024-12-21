//
//  LoginView.swift
//  Simart UMBY
//
//  Created by фкшуа on 15/11/24.
//

import SwiftUI
import Perception

struct LoginView: View {
    
    @Environment(AppState.self) var appState
    let model = LoginVM()
    
    var body: some View {
        @Perception.Bindable var _model = model
        
        WithPerceptionTracking {
            ScrollView {
                VStack {
                    Image("umby-logo").frame(width: 148, height: 144).padding(.top, 22)
                    
                    Text("SIMART").font(.system(size: 24, weight: .semibold)).foregroundStyle(Color("#18469C")).padding(.top, 24)
                    
                    Text("Sistem Informasi Aset Rumah Tangga").font(.system(size: 14)).foregroundStyle(Color("#465478")).padding(.top, 4)
                    
                    CustomTextField(value: $_model.loginForm.nis, label: "Testing", hint: "NIS").padding(.top, 24).padding(.horizontal, 16)
                    
                    CustomTextField(value: $_model.loginForm.password, label: "Password", hint: "******", isObsecure: true).padding([.top,    .horizontal], 16)
                    
                    CustomButton(title: "Login Local", backgroundColor: model.loginState == RequestState.LOADING ? Color.gray : Color("#18469C"), action: {
                        Task {
                            await model.login(appState: appState)
                        }
                    })
                    .padding(.horizontal, 16)
                    .padding(.top, 14)
                    
                    CustomButton(title: "Login SSO", borderColor: Color("#18469C"), action: {
                        print("testing sso")
                    })
                    .padding(.horizontal, 16)
                    .padding(.top, 14)
                    
                    HStack {
                        CustomCheckbox(isChecked: $_model.loginForm.isChecked, title: "Ingatkan Saya").frame(maxWidth: .infinity)
                        CustomButton(title: "Lupa Password?", textColor: Color("#2F80ED"), action: {})
                    }.padding(.top, 12)
                    
                    Text("Untuk alasan keamanan, silahkan logout  dan tutup browser Anda setelah selesai menggunakan layanan yang memerlukan otentikasi!")
                        .font(.system(size: 10))
                        .foregroundStyle(Color("#465478"))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color("#F665651A"))
                        .cornerRadius(4)
                        .overlay(Rectangle().frame(width: 4).clipShape(CustomCornerRadiusShape(topLeading: 4, bottomLeading: 4)).foregroundStyle(Color("#FF5D5D")), alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                }
                
            }
        }
    }
}
