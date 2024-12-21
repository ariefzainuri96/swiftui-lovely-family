//
//  CustomCommonMenu.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import SwiftUI

struct CustomCommonMenu: View {
    var title: String
    var textColor: String = "#333333"
    var paddingHorizontal: CGFloat = 16
    var action: (() -> Void)?
    
    var body: some View {
        if action != nil {
            Button(action: action ?? {}) {
                VStack {
                    HStack {
                        Text(title).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(Color(textColor)).frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image("ic-chevron-right").frame(width: 16, height: 16)
                    }.padding(.vertical, 12).padding(.horizontal, paddingHorizontal)
                    
                    Divider().frame(height: 1).overlay(Color("#EFEFEF"))
                }
            }
        } else {
            VStack {
                HStack {
                    Text(title).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(Color(textColor)).frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("ic-chevron-right").frame(width: 16, height: 16)
                }.padding(.vertical, 12).padding(.horizontal, paddingHorizontal)
                
                Divider().frame(height: 1).overlay(Color("#EFEFEF"))
            }
        }
        
        
    }
}
