//
//  CAShapeLayer+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var strokeColorKey = "strokeColorKey"
private var fillColorKey = "fillColorKey"

extension CAShapeLayer {

    /// strokeColor
    var whh_StrokeColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setStrokeColor:", dataKey: &strokeColorKey)

            self.strokeColor = WHHThemeManager.share.colorOf(key: value).cgColor

        }

        get {
            guard let rawValue = theme_valueFor(&strokeColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// fillColor
    var whh_FillColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setFillColor:", dataKey: &fillColorKey)

            self.fillColor = WHHThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&fillColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

}

extension CAShapeLayer {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        pickers.forEach({ (key, value) in

            let valueStr = (value as? String) ?? ""
            let result = WHHThemeManager.share.colorOf(key: valueStr).cgColor

            UIView.animate(withDuration: WHHThemeModeAnimationDuration, animations: {

                if key == "setShadowColor:" {

                    self.shadowColor = result

                } else if key == "setBorderColor:" {

                    self.borderColor = result

                } else if key == "setBackgroundColor:" {

                    self.backgroundColor = result

                } else if key == "setStrokeColor:" {

                    self.strokeColor = result

                } else if key == "setFillColor:" {

                    self.fillColor = result

                }
            })
        })
    }
}
