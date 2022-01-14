//
//  WHHTheme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
// 保存主题的模型

import Foundation

enum WHHTheme: String {
    case normal = "Normal" // 普通模式
    case night = "Night"   // 夜间模式

    enum Color: String {
        
        case viewBgColor  //所有view的背景颜色
        case navigationTintColor //导航的背景颜色
        case navigationTitleColor //导航条字体颜色
        case btnBgColor
        case btnTitleColor
        case textColor
        case childViewBgColor

    }

    enum Image: String {
        case App_Store = "App_Store"    // 半透明色图
    }
}
