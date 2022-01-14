//
//  UIPageControl+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var pageIndicatorTintColorKey = "pageIndicatorTintColorKey"
private var currentPageIndicatorTintColorKey = "currentPageIndicatorTintColorKey"

extension UIPageControl {
    /// pageIndicatorTintColor
    var whh_PageIndicatorTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setPageIndicatorTintColor:", dataKey: &pageIndicatorTintColorKey)

            self.pageIndicatorTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&pageIndicatorTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }

    /// currentPageIndicatorTintColor
    var whh_CurrentPageIndicatorTintColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setCurrentPageIndicatorTintColor:", dataKey: &currentPageIndicatorTintColorKey)

            self.currentPageIndicatorTintColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&currentPageIndicatorTintColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }
    }
}

