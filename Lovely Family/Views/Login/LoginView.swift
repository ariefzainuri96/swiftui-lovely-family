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
    
    private func buildAttributedString(fullText: String, highlightedWord: String) -> AttributedString {
        var attributedString = AttributedString(fullText)
        
        if let range = attributedString.range(of: highlightedWord) {
            attributedString[range].foregroundColor = .black
            attributedString[range].link = URL(string: "Tap://")
        }
        
        return attributedString
    }
    
    var body: some View {
        @Perception.Bindable var _model = model
        
        WithPerceptionTracking {
            ZStack {
                Color(.white)
                
                ScrollView {
                    VStack {
                        Image("img-logo")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding(.top, 40)
                        
                        Text("Welcome Back")
                            .font(.custom("AmericanTypewriter", fixedSize: 30).weight(.semibold)).padding(.top, 16)
                        
                        CustomTextField(value: $_model.loginForm.email, hint: "Email")
                            .padding(.top, 36)
                        
                        CustomTextField(value: $_model.loginForm.password, hint: "Password", isObsecure: true) {
                            Task {
                                await model.login(appState: appState)
                            }
                        }
                        .padding([.top], 12)
                        
                        ZStack(alignment: .center) {
                            VStack {}.frame(maxWidth: .infinity, minHeight: 1).background(Color("#F0EDED"))
                            
                            Text("Or")
                                .font(.system(size: 12, weight: .light, design: .default))
                                .padding(.horizontal, 10)
                                .background(.white)
                        }
                        .padding(.vertical, 20)
                        
                        HStack(alignment: .center, spacing: 20) {
                            VStack {
                                Image("img_facebook").resizable().frame(width: 20, height: 20)
                            }
                            .padding(.all, 12)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 1))
                            
                            VStack {
                                Image("img_google").resizable().frame(width: 20, height: 20)
                            }
                            .padding(.all, 12)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 1))
                        }
                        
                        Text(buildAttributedString(fullText: "Don't have an account? Sign up", highlightedWord: "Sign up"))
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.gray)
                            .padding(.top, 24)
                            .environment(\.openURL, OpenURLAction { url in
                                if url.absoluteString == "Tap://"{
                                    print("Sign up clicked")
                                }
                                return .discarded
                            })
                    }.padding(.horizontal, 16)
                }
            }
        }
    }
}
