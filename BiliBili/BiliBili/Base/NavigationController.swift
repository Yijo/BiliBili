//
//  NavigationController.swift
//  BiliBili
//
//  Created by Near on 2019/3/9.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
import SwiftTheme

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.theme_barTintColor = "NavigationController.barTintColor"
//        self.navigationBar.theme_titleTextAttributes = ThemeDictionaryPicker.pi
//        navigationBar.barTintColor = .red
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.blue]
        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
