//
//  DataExtension.swift
//  Lovely Family
//
//  Created by фкшуа on 25/12/24.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}