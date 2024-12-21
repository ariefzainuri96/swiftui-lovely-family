//
//  NewsItem.swift
//  Simart UMBY
//
//  Created by фкшуа on 11/12/24.
//

import SwiftUI

struct NewsItem: View {
    var data: PengumumanData
    var itemWidth: CGFloat
    
    let limit: Int = 100
    
    func getAttributedString() -> AttributedString {
        var string = AttributedString("\((data.pengumuman ?? "").prefix(limit))...")
        string.foregroundColor = .white
        string.font = .systemFont(ofSize: 14, weight: .light)
        
        // Terms of Conditions
        var tappableBacaSelengkapnyaText = AttributedString(" Baca Selengkapnya")
        tappableBacaSelengkapnyaText.link = URL(string: "BS://")
        tappableBacaSelengkapnyaText.foregroundColor = Color("#2F80ED")
        tappableBacaSelengkapnyaText.font = .systemFont(ofSize: 14, weight: .light)
        tappableBacaSelengkapnyaText.underlineStyle = .single
        string.append(tappableBacaSelengkapnyaText)
        
        return string
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.title ?? "").font(.system(size: 14, weight: .medium)).foregroundColor(.white).padding(.bottom, 4)
            
            Text(data.date ?? "").font(.system(size: 12)).foregroundColor(.white).padding(.bottom, 8)
            
            if (data.pengumuman ?? "").count <= limit {
                // Show full text if expanded or text is within the limit
                Text((data.pengumuman ?? ""))
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.white)
            } else {
                // Truncated text with "Baca Selengkapnya" right after "..."
                Text(getAttributedString())
                    .environment(\.openURL, OpenURLAction { url in
                        if url.absoluteString == "BS://"{
                            print("Baca selengkapnya clicked")
                        }
                        return .discarded
                    })
            }
        }.frame(width: itemWidth).padding(.vertical, 16).background(Color("213168")).cornerRadius(8)
    }
}
