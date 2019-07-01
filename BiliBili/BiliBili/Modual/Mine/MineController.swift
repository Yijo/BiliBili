//
//  MineController.swift
//  BiliBili
//
//  Created by Near on 2019/6/29.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
//import
class MineController: BaseViewController {

    let mineViewModel = MineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        let mineView = MineView.loadFromNib()
        
        self.view = mineView
    }
}
