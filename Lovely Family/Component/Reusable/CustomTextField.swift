//
//  CustomTextField.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import SwiftUI

// WARN: if you want to set infinite line, set maxline like 10000 

struct CustomTextField: View {
    @Binding var value: String
    var label: String?
    var hint: String = ""
    var isObsecure: Bool = false
    var disabled: Bool = false
    var maxLine: Int?
    var minLine: Int?
     
    var body: some View {
        VStack(alignment: .leading) {
            if (label != nil) {
                Text(label!).font(.system(size: 12, weight: .medium)).foregroundStyle(Color("#BFBFBF"))
            }
            
            if (isObsecure) {
                SecureField(hint, text: $value)
                    .font(.system(size: 14, weight: .thin))
                    .foregroundColor(Color("#333333"))
                    .background(Color.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color("#E0E0E0"), lineWidth: 1))
            } else {
                if #available(iOS 16.0, *) {
                    TextField(hint, text: $value, axis: (maxLine ?? 1) == 1 ? .horizontal : .vertical)
                        // maxline
                        .lineLimit(maxLine)
                        // fixed min line
                        .lineLimit((minLine ?? 1), reservesSpace: true)
                        .disabled(disabled)
                        .font(.system(size: 14, weight: .thin))
                        .foregroundColor(Color("#333333"))
                        .background(Color.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color("#E0E0E0"), lineWidth: 1))
                } else {
                    TextField(hint, text: $value)
                        .disabled(disabled)
                        .font(.system(size: 14, weight: .thin))
                        .foregroundColor(Color("#333333"))
                        .background(Color.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color("#E0E0E0"), lineWidth: 1))
                }
            }
        }
    }
}
