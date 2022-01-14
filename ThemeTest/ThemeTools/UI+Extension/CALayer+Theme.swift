//
//  CALayer+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit
private var shadowColorKey = "shadowColorKey"
private var borderColorKey = "borderColorKey"
private var backgroundColorKey = "backgroundColorKey"

extension CALayer {

    /// shadowColor
    var whh_ShadowColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setShadowColor:", dataKey: &shadowColorKey)

            self.shadowColor = WHHThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&shadowColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// borderColor
    var whh_BorderColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBorderColor:", dataKey: &borderColorKey)

            self.borderColor = WHHThemeManager.share.colorOf(key: value).cgColor

        }

        get {
            guard let rawValue = theme_valueFor(&borderColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// backgroundColor
    var hc_BackgroundColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBackgroundColor:", dataKey: &backgroundColorKey)

            self.backgroundColor = WHHThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&backgroundColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

}

extension CALayer {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        pickers.forEach({ (key, value) in

            let pickerKey = (value as? String) ?? ""
            let result = WHHThemeManager.share.colorOf(key: pickerKey).cgColor

            UIView.animate(withDuration: WHHThemeModeAnimationDuration, animations: {

                if key == "setShadowColor:" {

                    self.shadowColor = result

                } else if key == "setBorderColor:" {

                    self.borderColor = result

                } else if key == "setBackgroundColor:" {

                    self.backgroundColor = result

                }

            })

        })

    }

}

