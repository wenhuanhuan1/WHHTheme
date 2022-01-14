//
//  UILabel+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var textColorKey = "textColorKey"
private var shadowColorKey = "shadowColorKey"
private var highlightedTextColorKey = "highlightedTextColorKey"

extension UILabel {
 
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

    /// shadowColor
    var whh_ShadowColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setShadowColor:", dataKey: &shadowColorKey)

            self.shadowColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&shadowColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// highlightedTextColor
    var whh_HighlightedTextColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setHighlightedTextColor:", dataKey: &highlightedTextColorKey)

            self.highlightedTextColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&highlightedTextColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
    

}

