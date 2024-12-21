//
//  SimpleText.swift
//  Simart UMBY
//
//  Created by фкшуа on 07/12/24.
//
import SwiftUI

struct SimpleText: View {
    let content: String
    let onAppear: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(content)
                .font(.system(size: 16, weight: .medium))
                            
            Spacer()
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 1)
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear(perform: onAppear)
    }
}
