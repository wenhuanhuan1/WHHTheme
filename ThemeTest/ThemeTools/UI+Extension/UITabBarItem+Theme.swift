//
//  UITabBarItem+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var imageKey = "imageKey"
private var selectedImageKey = "selectedImageKey"

extension UITabBarItem {

    /// image
    var whh_Image: WHHTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }
            register(value, methodKey: "setImage:", dataKey: &imageKey)

            self.image = WHHThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&imageKey) else { return nil }
            return WHHTheme.Image(rawValue: rawValue)
        }
    }

    /// selectedImage
    var whh_SelectedImage: WHHTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }
            register(value, methodKey: "setSelectedImage:", dataKey: &selectedImageKey)

            self.selectedImage = WHHThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&selectedImageKey) else { return nil }
            return WHHTheme.Image(rawValue: rawValue)
        }
    }

}

