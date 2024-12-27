//
//  StringExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 16/12/24.
//

import Foundation

extension Optional where Wrapped == String {
    func defaultValue(_ defaultValue: String) -> String {
        if self?.isEmpty ?? true {
            return defaultValue
        }
        return self!
    }
}

extension String {
    /// Converts camelCase or PascalCase strings into a space-separated string with capitalized words.
    func camelCaseToWords() -> String {
        // Insert a space before each uppercase letter (except the first one)
        let spacedString = self.reduce("") { result, character in
            if character.isUppercase && !result.isEmpty {
                return result + " " + String(character)
            } else {
                return result + String(character)
            }
        }
        // Capitalize each word
        return spacedString.capitalized
    }
}
