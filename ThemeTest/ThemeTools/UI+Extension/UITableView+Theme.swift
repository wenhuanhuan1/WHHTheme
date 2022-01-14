//
//  UITableView+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import Foundation

import UIKit

private var separatorColorKey = "separatorColorKey"
private var sectionIndexColorKey = "sectionIndexColorKey"
private var sectionIndexBgColorKey = "sectionIndexBgColorKey"
private var sectionIndexTrackingBgColorKey = "sectionIndexTrackingBgColorKey"

extension UITableView {

    /// separatorColor
    var whh_SeparatorColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSeparatorColor:", dataKey: &separatorColorKey)

            self.separatorColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&separatorColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexColor
    var whh_SectionIndexColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexColor:", dataKey: &sectionIndexColorKey)

            self.sectionIndexColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexBackgroundColor
    var whh_SectionIndexBackgroundColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexBackgroundColor:", dataKey: &sectionIndexBgColorKey)

            self.sectionIndexBackgroundColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexBgColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexTrackingBackgroundColor
    var whh_SectionIndexTrackingBgColor: WHHTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexTrackingBackgroundColor:", dataKey: &sectionIndexTrackingBgColorKey)

            self.sectionIndexTrackingBackgroundColor = WHHThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexTrackingBgColorKey) else { return nil }
            return WHHTheme.Color(rawValue: rawValue)
        }

    }

}
