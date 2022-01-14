//
//  AppDelegate.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 初始化主题模式
        WHHThemeManager.share.configThemeType(.normal)
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = RootNavigationController(rootViewController: ViewController())
        
        window?.makeKeyAndVisible()
        return true
    }


}

