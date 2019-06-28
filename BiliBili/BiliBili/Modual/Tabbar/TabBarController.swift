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
        
        let loginVC = LoginController()
        
        self.present(loginVC, animated: true, completion: nil)
    }
}
