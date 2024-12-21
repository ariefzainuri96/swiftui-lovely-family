//
//  PopupMenuModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

struct PopupMenuModel {
    let title: String
    let icon: String
    var color: String?
    
    init(title: String, icon: String, color: String? = nil) {
        self.title = title
        self.icon = icon
        self.color = color
    }
}
