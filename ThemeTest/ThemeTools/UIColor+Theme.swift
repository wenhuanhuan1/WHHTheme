//
//  UIColor+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
// 颜色切换

import UIKit

extension UIColor {
    static func whh_rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    static func whh_hex(value: UInt32, alpha: CGFloat = 1) -> UIColor {
        let r = CGFloat((value & 0xff0000) >> 16)
        let g = CGFloat((value & 0x00ff00) >> 8)
        let b = CGFloat(value & 0x0000ff)
        return UIColor.whh_rgb(r: r, g: g, b: b, a: alpha)
    }
    
    static func whh_hexString(value: String) -> UIColor {
        guard let hexValue = Int(value, radix: 16) else { return UIColor.clear }
        
        var red = 0.0
        var green = 0.0
        var blue = 0.0
        var alpha = 255.0
        
        if value.count == 6 {
            red = Double((hexValue >> 16) & 0xff)
            green = Double((hexValue >> 8) & 0xff)
            blue = Double(hexValue & 0xff)
        } else if value.count == 8 {
            red = Double((hexValue >> 24) & 0xff)
            green = Double((hexValue >> 16) & 0xff)
            blue = Double((hexValue >> 8) & 0xff)
            alpha = Double(hexValue & 0xff)
        }
        
        return UIColor.whh_rgb(r: CGFloat(red), g: CGFloat(green), b: CGFloat(blue), a: CGFloat(alpha / 255.0))
    }
}
