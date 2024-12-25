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
    var hint: String = "Type here"
    var isObsecure: Bool = false
    var disabled: Bool = false
    var maxLine: Int?
    var minLine: Int?
    var handleOnCommit: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            if (label != nil) {
                Text(label!).font(.system(size: 12, weight: .medium)).foregroundStyle(Color("#BFBFBF"))
            }
            
            ZStack(alignment: .center) {
                if value.isEmpty {
                    Text(hint)
                        .foregroundColor(.gray)
                        .font(.system(size: 14, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16).padding(.vertical, 14)
                }
                
                if (isObsecure) {
                    SecureField("", text: $value, onCommit: handleOnCommit ?? {})
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .font(.system(size: 14, design: .default))
                        .foregroundColor(Color("#333333"))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                } else {
                    if #available(iOS 16.0, *) {
                        TextField("", text: $value, axis: (maxLine ?? 1) == 1 ? .horizontal : .vertical)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                            .onSubmit(handleOnCommit ?? {})
                            .lineLimit(maxLine)
                            .lineLimit((minLine ?? 1), reservesSpace: true)
                            .disabled(disabled)
                            .font(.system(size: 14, design: .default))
                            .foregroundColor(Color("#333333"))
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                    } else {
                        TextField("", text: $value, onCommit: handleOnCommit ?? {})
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                            .disabled(disabled)
                            .font(.system(size: 14, design: .default))
                            .foregroundColor(Color("#333333"))                            
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                    }
                }
            }
        }
    }
}
