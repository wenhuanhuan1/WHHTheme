//
//  WHHNotificationName.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//  保存通知

import Foundation

struct WHHThemeNotification {
    // 语言环境切换通知
    static let localizableDidChange = NSNotification.Name(rawValue: "WHHTheme.localizableDidChange")
    
    // 主题更换通知
    static let themeDidChange = NSNotification.Name(rawValue: "WHHTheme.themeDidChange")
    
}
