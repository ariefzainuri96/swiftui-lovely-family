//
//  CustomPopupItem.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

import SwiftUI

struct CustomPopupItem: View {
    let data: PopupMenuModel
    let onTapGesture: () -> Void
    
    var body: some View {
        Button {
            onTapGesture()
        } label: {
            HStack {
                Text(data.title).font(.system(size: 14, weight: .medium, design: .default)).foregroundColor(Color("#BFBFBF")).frame(maxWidth: .infinity, alignment: .leading)
                
                Image(data.icon).frame(width: 18, height: 18).foregroundColor(Color("#333333"))
            }
        }
    }
}
