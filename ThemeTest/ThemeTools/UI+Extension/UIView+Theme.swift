//
//  UIView+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var backgroundColorKey = "backgroundColorKey"
private var tintColorKey = "tintColorKey"

extension UIView {
    /// backgroundColor
    var whh_BackgroundColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBackgroundColor:", dataKey: &backgroundColorKey)

            self.backgroundColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&backgroundColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// tintColor
    var whh_TintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTintColor:", dataKey: &tintColorKey)

            self.tintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&tintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
}
