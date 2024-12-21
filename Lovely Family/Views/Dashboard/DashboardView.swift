//
//  DashboardView.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct DashboardView: View {
    @Environment(AppState.self) var appState
    
    @State private var dashboardVM = DashboardVM()
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                NavigationView {
                    ZStack {
                        Image("simart-dashboard-bg")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0) // 👈 This will keep other views (like a large text) in the frame
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("SIMART").font(.system(size: 24, weight: .semibold)).foregroundColor(.white)
                                
                                Spacer()
                                
                                Image("ic-notification").frame(width: 16, height: 16).padding(.all, 10).background(
                                    Color("#FFFFFF26")
                                ).cornerRadius(1000)
                                
//                                NavigationLink(destination: ProfileView().environment(appState)) {
//                                    Text("S").font(.system(size: 14, weight: .medium)).foregroundColor(.white).frame(width: 36, height: 36).background(Color("#E53C3C")).cornerRadius(1000)
//                                }
                            }.padding(.top, 10).padding(.horizontal, 16)
                            
                            CustomStateView(
                                state: dashboardVM.pengumumanState,
                                onRetry: {
                                    Task {
                                        await dashboardVM.getPengumuman()
                                    }
                                },
                                content: {
                                    NewsSection().environment(dashboardVM)
                                }
                            )
                            .frame(maxWidth: .infinity, minHeight: 140, alignment: .center)
                            
                            MenuSection().environment(dashboardVM).padding(.top, 10)
                            
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                }
            }.task {
                await dashboardVM.getPengumuman()
            }
        }
    }
}
