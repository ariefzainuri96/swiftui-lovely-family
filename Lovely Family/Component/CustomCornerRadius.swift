//
//  CustomCornerRadius.swift
//  Simart UMBY
//
//  Created by фкшуа on 21/11/24.
//

import SwiftUI

struct CustomCornerRadiusShape: Shape {
    var topLeading: CGFloat = 0
    var topTrailing: CGFloat = 0
    var bottomLeading: CGFloat = 0
    var bottomTrailing: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start at the top-left corner
        path.move(to: CGPoint(x: rect.minX + topLeading, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + topLeading),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        
        // Top edge to the top-right corner
        path.addLine(to: CGPoint(x: rect.maxX - topTrailing, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + topTrailing),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Right edge to the bottom-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomTrailing))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - bottomTrailing, y: rect.maxY),
                          control: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Bottom edge to the bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX + bottomLeading, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - bottomLeading),
                          control: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Left edge back to the top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeading))
        
        return path
    }
}
