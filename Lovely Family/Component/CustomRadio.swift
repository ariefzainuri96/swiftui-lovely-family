//
//  CustomRadio.swift
//  Simart UMBY
//
//  Created by фкшуа on 16/12/24.
//

import SwiftUI

struct CustomRadio: View {
    private let label: String
    @Binding private var isSelected: Bool
    private let spacing: CGFloat
    
    init(label: String = "", isSelected: Binding<Bool>, spacing: CGFloat = 10) {
        self.label = label
        self._isSelected = isSelected
        self.spacing = spacing
    }
    
    init<V: Hashable>(tag: V, selection: Binding<V?>, label: String = "", spacing: CGFloat = 10) {
        self._isSelected = Binding(
            get: { selection.wrappedValue == tag },
            set: { _ in selection.wrappedValue = tag }
        )
        self.label = label
        self.spacing = spacing
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            Circle()
                .fill(isSelected ? Color("#495CDF") : .clear)
                .padding(4)
                .overlay(Circle().stroke(isSelected ? Color("#495CDF") : Color("#BFBFBF"), lineWidth: 2))
                .frame(width: 20, height: 20)
            
            Text(label).font(.system(size: 14, weight: .medium, design: .default))
        }        
        .onTapGesture {
            isSelected = true
        }
    }
}
