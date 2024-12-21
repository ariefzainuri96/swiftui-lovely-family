//
//  CustomCheckbox.swift
//  Simart UMBY
//
//  Created by фкшуа on 21/11/24.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var title: String
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            // 4. Add a label for the Toggle
            Text(title).font(.system(size: 14, weight: .medium)).foregroundStyle(Color("#465478"))
        }
        // 5. Add styling to make it look like a checkbox
        .toggleStyle(CheckboxToggleStyle())
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .foregroundColor(configuration.isOn ? Color("#1E3A8A") : .gray)
                .frame(width: 24, height: 24)
                .foregroundStyle(Color("#BFBFBF"))
                .onTapGesture { configuration.isOn.toggle() }
                .padding(.trailing, 12)
            
            configuration.label
        }.onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

//#Preview {
//    @State private var isChecked = false
//
//    CustomCheckbox(isChecked: @isChecked)
//}
