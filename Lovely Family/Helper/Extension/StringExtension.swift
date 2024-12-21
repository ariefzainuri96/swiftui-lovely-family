//
//  StringExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 16/12/24.
//

extension Optional where Wrapped == String {
    func defaultValue(_ defaultValue: String) -> String {
        if self?.isEmpty ?? true {
            return defaultValue
        }
        return self!
    }
}
