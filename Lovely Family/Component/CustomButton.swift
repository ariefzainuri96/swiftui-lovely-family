//
//  CustomButton.swift
//  Simart UMBY
//
//  Created by фкшуа on 21/11/24.
//

import SwiftUI

enum ButtonStyle {
    case Primary, Outlined
}

struct CustomButton: View {
    var title: String
    var backgroundColor: Color?
    var borderColor: Color?
    var textColor: Color?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title).foregroundStyle(textColor ?? borderColor ?? .white)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor ?? Color("#00000000"), lineWidth: 1))
        }
        .cornerRadius(8)
    }
}
