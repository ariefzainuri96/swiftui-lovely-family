//
//  CustomButtonBottomSheet.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

import SwiftUI

struct CustomButtonBottomSheet<Content: View>: View {
    let label: String?
    let value: String
    var isLoading: Bool = false
    @Binding var isSheetOpen: Bool
    let content: () -> Content
        
    var body: some View {
        VStack(alignment: .leading) {
            if (label != nil) {
                Text(label!).font(.system(size: 12, weight: .medium)).foregroundStyle(Color("#BFBFBF"))
            }
            
            HStack {
                Text(value).font(.system(size: 14, weight: .thin, design: .default)).foregroundColor(Color("#333333")).frame(maxWidth: .infinity, alignment: .leading).lineLimit(1)
                
                Image("ic-chevron-down").frame(width: 16, height: 16).tint(Color("#465478"))
            }
            .padding(.vertical, 12).padding(.horizontal, 16)
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color("#E0E0E0"), lineWidth: 1))
            .background(.white)
            .onTapGesture {
                if isLoading {
                    return
                }
                
                isSheetOpen.toggle()
            }
        }.sheet(isPresented: $isSheetOpen) {
            if #available(iOS 16.0, *) {
                content().presentationDetents([.fraction(0.5)])
            } else {
                content()
            }
        }
    }
}
