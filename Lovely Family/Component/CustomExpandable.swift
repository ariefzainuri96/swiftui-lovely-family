//
//  CustomExpandable.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import SwiftUI

struct CustomExpandable<Header: View, Content: View>: View {
    @State private var isExpanded: Bool = false // Local state for expansion
    
    let header: () -> Header
    let expandedContent: () -> Content
    
    @State private var contentHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }) {
                header()
            }
            
            expandedContent()
                .background(
                    HeightMeasuringView()
                        .onPreferenceChange(ViewHeightKey.self) { height in
                            contentHeight = height
                        }
                )
                .frame(height: isExpanded ? contentHeight : 0)
                .clipped()
                .animation(.easeInOut, value: isExpanded)
        }
    }
}

struct HeightMeasuringView: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: ViewHeightKey.self, value: geometry.size.height)
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
