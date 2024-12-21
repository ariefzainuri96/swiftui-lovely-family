//
//  CustomError.swift
//  Simart UMBY
//
//  Created by фкшуа on 13/12/24.
//

import SwiftUI

struct CustomError: View {
    
    var error: String = "Gagal mendapatkan data, "
    var onRetry: () -> Void
    
    func getAttributedString() -> AttributedString {
        var string = AttributedString(error)
        string.foregroundColor = Color("#333")
        string.font = .systemFont(ofSize: 14, weight: .regular)
        
        // Terms of Conditions
        var retryText = AttributedString("Retry?")
        retryText.link = URL(string: "BS://")
        retryText.foregroundColor = Color("#1E3A8A")
        retryText.font = .systemFont(ofSize: 14, weight: .semibold)
        string.append(retryText)
        
        return string
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle").frame(width: 20, height: 20)
            
            Text(getAttributedString())
                .environment(\.openURL, OpenURLAction { url in
                    if url.absoluteString == "BS://"{
                        onRetry()
                    }
                    return .discarded
                })
        }
    }
}
