//
//  Colors.swift
//  pr0
//
//  Created by Spykea on 01/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import Foundation
import Material

struct Colors {

    // Own color palette
    static let primaryColorLight = Color.teal.lighten3
    static let primaryColor = UIColor(hexString: "#ee4d2e")
    static let primaryColorDark = Color.teal.darken2
    static let primaryColorDarkest = Color.teal.darken4
    static let accentColor = Color.deepPurple.accent2
    static let accentColorDark = Color.deepPurple.accent3
    static let fontColor = Color.white

    static let backgroundColor = UIColor(hexString: "#161618")
    static let darkBackgroundColor = Color.grey.lighten3

    // Font colors
    static let darkPrimaryTextColor = Color.black.withAlphaComponent(0.87)
    static let darkSecondaryTextColor = Color.black.withAlphaComponent(0.54)
    static let darkDisabledTextColor = Color.black.withAlphaComponent(0.38)
    static let darkDividerColor = Color.black.withAlphaComponent(0.12)

    static let lightPrimaryTextColor = Color.white.withAlphaComponent(1.0)
    static let lightSecondaryTextColor = Color.white.withAlphaComponent(0.7)
    static let lightDisabledTextColor = Color.white.withAlphaComponent(0.5)
    static let lightDividerColor = Color.white.withAlphaComponent(0.12)

    static let navigationItemLabelColor = Color.black.withAlphaComponent(0.87)
}

// MARK: Value Converter

/*
 func colorWithHexString (hex:String) -> UIColor {
 var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString

 if (cString.hasPrefix("#")) {
 cString = (cString as NSString).substringFromIndex(1)
 }

 if (cString.characters.count != 6) {
 return UIColor.grayColor()
 }

 let rString = (cString as NSString).substringToIndex(2)
 let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
 let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)

 var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
 NSScanner(string: rString).scanHexInt(&r)
 NSScanner(string: gString).scanHexInt(&g)
 NSScanner(string: bString).scanHexInt(&b)


 return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
 }
 */

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
