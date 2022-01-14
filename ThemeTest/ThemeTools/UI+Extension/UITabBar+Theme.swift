//
//  UINavigationBar+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var barTintColorKey = "barTintColorKey"

extension UITabBar {
    /// barTintColor
    var whh_BarTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBarTintColor:", dataKey: &barTintColorKey)

            self.barTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&barTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
    
    
}

