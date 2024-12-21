//
//  UIColorExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import UIKit

extension UIColor {
    /// Initializes a UIColor object with a hexadecimal string.
    ///
    /// - Parameter hex: The hex string (e.g., "#RRGGBB" or "RRGGBB").
    /// - Returns: UIColor instance if the conversion is successful; nil otherwise.
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized
        
        let length = hexSanitized.count
        var rgbValue: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgbValue) else {
            return nil
        }
        
        switch length {
        case 3: // RGB (12-bit)
            let r = CGFloat((rgbValue & 0xF00) >> 8) / 15.0
            let g = CGFloat((rgbValue & 0x0F0) >> 4) / 15.0
            let b = CGFloat(rgbValue & 0x00F) / 15.0
            self.init(red: r, green: g, blue: b, alpha: 1.0)
        case 6: // RRGGBB (24-bit)
            let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgbValue & 0x0000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: 1.0)
        default:
            return nil
        }
    }
}
