//
//  ViewController.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.whh_BackgroundColor = WHHTheme.Color.viewBgColor
        _configNavigationBar()
        addUI()
    }
    //
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        if WHHThemeManager.share.current == WHHTheme.normal {
            
            return .default
        }else {
            
            return .lightContent
        }
        
    }
    private func _configNavigationBar() {
       
        self.title = "Theme"
        self.navigationController?.navigationBar.whh_TintColor = WHHTheme.Color.navigationTitleColor
        self.navigationController?.navigationBar.whh_BackgroundColor = WHHTheme.Color.childViewBgColor
        let rightView = UIView()
        let changeBtn = UIButton()
        
        changeBtn.setTitle("change", for: .normal)
        changeBtn.whh_setTitleColorPicker(WHHTheme.Color.btnTitleColor, forState: .normal)

        changeBtn.contentHorizontalAlignment = .right
//        changeBtn.whh_BackgroundColor = WHHTheme.Color.btnBgColor
        changeBtn.addTarget(self, action: #selector(changeBtnClick), for: .touchUpInside)
        rightView.addSubview(changeBtn)
        
        rightView.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        changeBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView)
    }
    func addUI() {
    
        let leftView = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        leftView.whh_BackgroundColor = WHHTheme.Color.childViewBgColor
        view.addSubview(leftView)
        let contentLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100));
        contentLabel.text = "这是测试主题切换元素哈哈哈"
        contentLabel.textAlignment = .center
        contentLabel.numberOfLines = 0
        contentLabel.whh_TextColor = WHHTheme.Color.textColor
        contentLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(contentLabel)
        
    }
    @objc func changeBtnClick() {
        
        let theme = WHHThemeManager.share.current == WHHTheme.night ? WHHTheme.normal : WHHTheme.night
        WHHThemeManager.share.configThemeType(theme)
        self.setNeedsStatusBarAppearanceUpdate()
    }
}

