//
//  News.swift
//  Simart UMBY
//
//  Created by фкшуа on 26/11/24.
//

import SwiftUI
import Perception

struct NewsSection: View {
    @Environment(DashboardVM.self) var dashboardVM
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width * 0.8 // Item width is 80% of the screen width
            let spacing: CGFloat = 16 // Spacing between items
            let totalWidth = itemWidth + spacing // Total width of each item plus spacing
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(dashboardVM.pengumumanList, id: \.id) { item in
                        NewsItem(data: item, itemWidth: itemWidth)
                    }
                }
                .padding(.horizontal, 12) // Ensure partial visibility
                .offset(x: CGFloat(currentIndex) * -totalWidth, y: 0)
            }
        }.frame(maxWidth: .infinity, maxHeight: 140)
    }
}
