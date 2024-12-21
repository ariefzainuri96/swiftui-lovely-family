//
//  ManajemenAset.swift
//  Simart UMBY
//
//  Created by фкшуа on 29/11/24.
//

import SwiftUI

struct ManajemenAset: View {
    @Environment(DashboardVM.self) var dashboardVM
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        VStack {
            Text("Manajemen Aset")
        }
    }
}
