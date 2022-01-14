//
//  UITextField+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit
private var textColorKey = "textColorKey"

extension UITextField {
    /// textColor
    var whh_TextColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTextColor:", dataKey: &textColorKey)

            self.textColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&textColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
}

