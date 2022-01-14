//
//  UIButton+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit
private var backgroundColorKey = "backgroundColorKey"

extension UIButton {

    /// 设置titleColor
    ///
    /// - Parameters:
    ///   - theme: 主题色
    ///   - state: 状态
    func whh_setTitleColorPicker(_ theme: WHHTheme.Color, forState state: UIControl.State) {

        self.setTitleColor(WHHThemeManager.share.colorOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setTitleColor:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }

    /// 设置backgroundImage
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func hc_setBackgroundImage(_ theme: WHHTheme.Image, forState state: UIControl.State) {
        self.setBackgroundImage(WHHThemeManager.share.imageOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setBackgroundImage:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }

    /// 设置Image
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func whh_setImage(_ theme: WHHTheme.Image, forState state: UIControl.State) {

        self.setImage(WHHThemeManager.share.imageOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setImage:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }
}

extension UIButton {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        self.pickers.forEach({ (key, value) in

            if let dict = value as? [String: Any] {

                dict.forEach({(stateKey, selectorValue) in

                    let state: UIControl.State = UIControl.State(rawValue: UIControl.State.RawValue(key)!)
                    let selectorStr = (selectorValue as? String) ?? ""

                    UIView.animate(withDuration: WHHThemeModeAnimationDuration, animations: {

                        if stateKey == "setTitleColor:forState:" {
                            self.setTitleColor(WHHThemeManager.share.colorOf(key: selectorStr), for: state)
                        } else if stateKey == "setBackgroundImage:forState:" {
                            self.setBackgroundImage(WHHThemeManager.share.imageOf(key: selectorStr), for: state)
                        } else if stateKey == "setImage:forState:" {
                            self.setImage(WHHThemeManager.share.imageOf(key: selectorStr), for: state)
                        }
                    })
                })
            } else {
                let sel: Selector = Selector(key)
                let valueStr = (value as? String) ?? ""
                let result = WHHThemeManager.share.colorOf(key: valueStr)

                UIView.animate(withDuration: WHHThemeModeAnimationDuration, animations: {
                    self.perform(sel, with: result)
                })
            }
        })

    }

}
