//
//  BottomSheetDropdown.swift
//  Simart UMBY
//
//  Created by фкшуа on 07/12/24.
//

import SwiftUI
import Perception

struct BottomSheetDropdown<Content: View>: View {
    let title: String
    let listView: () -> Content
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Color.white
                
                VStack {
                    Text(title).font(.system(size: 16, weight: .medium, design: .default)).padding(.top, 16)
                    
                    listView().padding(0)
                    
                    Spacer()
                }
            }
        }
    }
}
