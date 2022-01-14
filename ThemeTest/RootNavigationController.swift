//
//  RootNavigationController.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    

}


