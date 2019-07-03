//
//  UIKit+Theme.swift
//  BiliBili
//
//  Created by Near on 2019/7/3.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
import Foundation
import SwiftTheme

@IBDesignable
extension UIButton {

    var themeValue: ThemePrimaryKey {
        get {
            return self.themeValue
        }
        set {
            self.themeValue = newValue
        }
    }
    @IBInspectable
    var themePrimaryKey: String {
        get {
            return self.themeValue.rawValue
        }
        set {
            let keyPath = newValue
            print("keypath: \(keyPath)")
            
            self.theme_backgroundColor = ThemeColorPicker(keyPath: "\(keyPath).backgroundColor")
            self.theme_setTitleColor(ThemeColorPicker(keyPath: "\(keyPath).titleColor"), forState: .normal)
            self.themeValue = ThemePrimaryKey(rawValue: newValue) ?? .none
        }
    }
}

//@IBDesignable
//extension UIView {
//    
//    @IBInspectable
//    var themePrimaryKey: String {
//        get {
//            return self.themePrimaryKey
//        }
//        set {
//            let keyPath = newValue
//            print("keypath: \(keyPath)")
//            
//            self.theme_backgroundColor = ThemeColorPicker(keyPath: "\(keyPath).backgroundColor")
//            self.themePrimaryKey = newValue
//        }
//    }
//}
