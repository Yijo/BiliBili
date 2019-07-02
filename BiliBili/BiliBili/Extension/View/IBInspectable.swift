//
//  IBInspectable.swift
//  BiliBili
//
//  Created by Near on 2019/6/28.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
import SwiftTheme
@objc enum ThemePrimaryKey: Int {
    case light
    case night
}
extension UIView {
    
    @IBInspectable var themePrimaryKey: ThemePrimaryKey {
        get {
            return self.themePrimaryKey
        }
        set {
            self.themePrimaryKey = newValue
            self.theme_backgroundColor = ["#fff", "000"]
        }
    }
}
