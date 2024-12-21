//
//  ManajemenBarangPakaiHabis.swift
//  Simart UMBY
//
//  Created by фкшуа on 29/11/24.
//

import SwiftUI

struct ManajemenBarangPakaiHabis: View {
    @Environment(DashboardVM.self) var dashboardVM
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        VStack {
            Text("Manajemen Barang Pakai Habis")
        }
    }
}
