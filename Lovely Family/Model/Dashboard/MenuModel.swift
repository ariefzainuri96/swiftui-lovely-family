//
//  MenuModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 29/11/24.
//

import Foundation

struct MenuModel: Identifiable {
    var id: Int
    var image: String
    var title: String
    var bgColor: String
    var onClick: () -> Void
}
