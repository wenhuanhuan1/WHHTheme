//
//  UISlider+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var minimumTrackTintColorKey = "minimumTrackTintColorKey"
private var maximumTrackTintColorKey = "maximumTrackTintColorKey"
private var thumbTintColorKey = "thumbTintColorKey"

extension UISlider {
    /// minimumTrackTintColor
    var whh_MinimumTrackTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setMinimumTrackTintColor:", dataKey: &minimumTrackTintColorKey)

            self.minimumTrackTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&minimumTrackTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

    /// maximumTrackTintColor
    var whh_MaximumTrackTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setMaximumTrackTintColor:", dataKey: &maximumTrackTintColorKey)

            self.maximumTrackTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&maximumTrackTintColorKey) else { return nil }
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
