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
    @Binding var isObsecure: Bool
    private var showPassword: Bool
    private var label: String?
    private var hint: String = "Type here"
    private var disabled: Bool
    private var maxLine: Int?
    private var minLine: Int?
    private var handleOnCommit: (() -> Void)?
    private var error: String?
    
    init(
        value: Binding<String>, isObsecure: Binding<Bool> = .constant(false), showPassword: Bool = false, label: String? = nil, hint: String, disabled: Bool = false, maxLine: Int? = nil, minLine: Int? = nil, error: String? = nil, handleOnCommit: (() -> Void)? = nil
    ) {
        self._value = value
        self._isObsecure = isObsecure
        self.showPassword = showPassword
        self.label = label
        self.hint = hint
        self.disabled = disabled
        self.maxLine = maxLine
        self.minLine = minLine
        self.error = error
        self.handleOnCommit = handleOnCommit
    }
    
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
                
                if isObsecure {
                    SecureField("", text: $value, onCommit: handleOnCommit ?? {})
                        .padding(.leading, 16)
                        // we add 32 because of trailing icon to reveal password
                        .padding(.trailing, 32)
                        .frame(height: 48)
                        .lineLimit(1)
                        .lineLimit(1)
                        .disabled(disabled)
                        .font(.system(size: 14, design: .default))
                        .foregroundColor(Color("#333333"))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                } else {
                    if #available(iOS 16.0, *) {
                        TextField("", text: $value, axis: (maxLine ?? 1) == 1 ? .horizontal : .vertical)
                            .padding(.horizontal, 16)
                            .frame(height: 48)
                            .onSubmit(handleOnCommit ?? {})
                            .lineLimit(maxLine)
                            .lineLimit((minLine ?? 1), reservesSpace: true)
                            .disabled(disabled)
                            .font(.system(size: 14, design: .default))
                            .foregroundColor(Color("#333333"))
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                    } else {
                        TextField("", text: $value, onCommit: handleOnCommit ?? {})
                            .padding(.horizontal, 16)
                            .frame(height: 48)
                            .disabled(disabled)
                            .font(.system(size: 14, design: .default))
                            .foregroundColor(Color("#333333"))                            
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("#000"), lineWidth: 1))
                    }
                }
            }
            .overlay(alignment: .trailing) {
                if showPassword {
                    Image(systemName: isObsecure ? "eye.slash.fill" : "eye.fill")
                        .padding(.trailing, 16)
                        .onTapGesture {
                            self.isObsecure.toggle()
                        }
                }
            }
            
            if let error = error, !error.isEmpty {
                Text(error).font(.system(size: 12, design: .default)).foregroundColor(.red)
            }
        }
    }
}
