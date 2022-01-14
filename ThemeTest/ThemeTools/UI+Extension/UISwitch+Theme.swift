//
//  UISwitch+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit
private var onTintColorKey = "onTintColorKey"
private var thumbTintColorKey = "thumbTintColorKey"

extension UISwitch {
    /// onTintColor
    var whh_OnTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setOnTintColor:", dataKey: &onTintColorKey)

            self.onTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&onTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// thumbTintColor
    var whh_ThumbTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setThumbTintColor:", dataKey: &thumbTintColorKey)

            self.thumbTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&thumbTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

}

