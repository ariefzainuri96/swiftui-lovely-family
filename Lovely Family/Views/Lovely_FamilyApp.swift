//
//  Simart_UMBYApp.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI
import Perception

@main
struct LovelyFamilyApp: App {
    @State var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            WithPerceptionTracking {
                if (appState.isLogin) {
                    DashboardView().environment(appState)
                } else {
                    LoginView().environment(appState)
                }
            }
        }
    }
}
