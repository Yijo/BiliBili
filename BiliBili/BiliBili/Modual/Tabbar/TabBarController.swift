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
        
        addChildVC()
    }
}


// MARK: - Add children controllers
private extension TabBarController {
    func addChildVC() {
        let addChildProvider = TabBarAddChildProvider()
        for child in addChildProvider.childControllers {
            // add coordinator
//            let coordinator
            addChild(child)
        }
    }
}
