//
//  TabBarController.swift
//  BiliBili
//
//  Created by Near on 2019/6/28.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild()
    }
}


// MARK: - Add children controllers
private extension TabBarController {
    func addChild() {
        let addChildProvider = TabBarAddChildProvider()
        for child in addChildProvider.childControllers {
            addChildViewController(child)
        }
    }
}
