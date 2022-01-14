//
//  UIProgressView+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var progressTintColorKey = "progressTintColorKey"
private var trackTintColorKey = "trackTintColorKey"

extension UIProgressView {
    /// progressTintColor
    var whh_ProgressTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setProgressTintColor:", dataKey: &progressTintColorKey)

            self.progressTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&progressTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

    /// trackTintColor
    var whh_TrackTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTrackTintColor:", dataKey: &trackTintColorKey)

            self.trackTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&trackTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
}

