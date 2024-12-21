//
//  ManajemenInventaris.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct ManajemenInventarisView: View {
    @Environment(DashboardVM.self) var dashboardVM
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink(destination: DataBarangAsetView(shouldPopToRootView: $rootIsActive).environment(dashboardVM)) {
                    CustomCommonMenu(title: "Data Barang Aset")
                }.padding(.top, 4)
                
                NavigationLink(destination: DataBarangAsetView(shouldPopToRootView: $rootIsActive).environment(dashboardVM)) {
                    CustomCommonMenu(title: "Data Barang Habis Pakai")
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle("Manajemen Inventaris")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                setNavigationBarLayout()
            }
            
//             Add the StatusBarModifier to change the status bar color
//            StatusBarModifier(backgroundColor: UIColor(hex: "#000") ?? UIColor.clear)
//                .frame(width: 0, height: 0)
        }
    }
}
