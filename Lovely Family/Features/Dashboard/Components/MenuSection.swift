//
//  MenuSection.swift
//  Simart UMBY
//
//  Created by фкшуа on 27/11/24.
//

import SwiftUI

struct MenuSection: View {
    @Environment(DashboardVM.self) var dashboardVM
    
    @State private var manajemenInventarisRootActive = false
    @State private var manajemenBarangPakaiHabisRootActive = false
    @State private var manajemenAsetRootActive = false
    @State private var taskApprovalRootActive = false
    
    let layout = [
        GridItem(.adaptive(minimum: 80), alignment: .top),
        GridItem(.adaptive(minimum: 80), alignment: .top),
        GridItem(.adaptive(minimum: 80), alignment: .top),
        GridItem(.adaptive(minimum: 80), alignment: .top),
    ]
    
//    func getDestination(id: Int) -> AnyView {
//        if (id == 0) {
//            return AnyView(ManajemenInventarisView(rootIsActive: $manajemenInventarisRootActive).environment(dashboardVM))
//        } else if (id == 1) {
//            return AnyView(ManajemenBarangPakaiHabis(rootIsActive: $manajemenBarangPakaiHabisRootActive).environment(dashboardVM))
//        } else if (id == 2) {
//            return AnyView(ManajemenAset(rootIsActive: $manajemenAsetRootActive).environment(dashboardVM))
//        } else {
//            return AnyView(TaskApproval(rootIsActive: $taskApprovalRootActive).environment(dashboardVM))
//        }
//    }
//    
//    func getRootActive(id: Int) -> Binding<Bool> {
//        if (id == 0) {
//            return $manajemenInventarisRootActive
//        } else if (id == 1) {
//            return $manajemenBarangPakaiHabisRootActive
//        } else if (id == 2) {
//            return $manajemenAsetRootActive
//        } else {
//            return $taskApprovalRootActive
//        }
//    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
//            LazyVGrid(columns: layout) {
//                ForEach(dashboardVM.menuList) { item in
//                    NavigationLink(destination: getDestination(id: item.id), isActive: getRootActive(id: item.id)) {
//                        MenuItem(menu: item)
//                    }
//                }
//            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 10) {
                Image("ic-scan").frame(width: 24, height: 24).foregroundColor(.white)
                
                Text("Scan QR Code").font(.system(size: 14, weight: .semibold)).foregroundColor(.white)
            }.padding(.all, 16).background(Color("#1E3A8A")).cornerRadius(1000).padding(.bottom, 16).frame(maxWidth: .infinity, alignment: .center)
            
        }.padding(.all, 16).background(.white).cornerRadius(32, corners: [.topLeft, .topRight])
    }
}

struct MenuItem: View {
    var menu: MenuModel
    
    var body: some View {
        VStack {
            Image(menu.image).frame(width: 24, height: 24).padding(.all, 10).background(Color(menu.bgColor)).cornerRadius(1000).padding(.bottom, 8)
            
            Text(menu.title).multilineTextAlignment(.center).font(.system(size: 11, weight: .regular)).foregroundColor(Color("#333333"))
        }
    }
}
