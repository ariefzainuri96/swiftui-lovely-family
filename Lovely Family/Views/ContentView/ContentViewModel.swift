//
//  ListViewModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 12/11/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    @Published var selected = "Archery"
    @Published var selectedColor: Color = .blue
    @Published var id = 1
    
    func generateRandomSport() {
        withAnimation(.easeInOut(duration: 0.5)) {
            selected = activities.randomElement() ?? "Archery"
            selectedColor = colors.randomElement() ?? .blue
            id += 1
        }
    }
}
