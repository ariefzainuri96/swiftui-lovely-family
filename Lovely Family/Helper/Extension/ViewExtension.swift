//
//  ViewExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 15/11/24.
//

import Foundation
import SwiftUI

extension View {
    func roundedCornerWithBorder(lineWidth: CGFloat, borderColor: Color, radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
            .overlay(RoundedCorner(radius: radius, corners: corners)
                .stroke(borderColor, lineWidth: lineWidth))
    }
    
    func centerInParentView() -> some View {
        VStack(alignment: .center) {
            self
        }
        .frame(maxWidth: .infinity)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
        
}
