//
//  UIImageView+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

private var imgKey = "imgKey"

extension UIImageView {

    /// 设置Image
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func whh_InitWithImagePicker(_ theme: WHHTheme.Image) -> UIImageView {
        let imageView = UIImageView(image: WHHThemeManager.share.imageOf(key: theme.rawValue))
        imageView.whh_Image = theme
        return imageView
    }

    /// image
    var whh_Image: WHHTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setImage:", dataKey: &imgKey)

            self.image = WHHThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&imgKey) else { return nil }
            return WHHTheme.Image(rawValue: rawValue)
        }
    }
    
}

extension UIImageView {
    // 主题更新通知方法
    @objc override func themeUpdate() {
        pickers.forEach({ (selectorKey, themeColor) in
            let sel: Selector = Selector(selectorKey)
            let key = (themeColor as? String) ?? ""
            let result = WHHThemeManager.share.imageOf(key: key)
            
            UIView.animate(withDuration: WHHThemeModeAnimationDuration, animations: {
                
                self.perform(sel, with: result)
                
            })
        })
    }
}
