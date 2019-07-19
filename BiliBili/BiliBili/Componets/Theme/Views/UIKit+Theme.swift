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

protocol SomeProtocol {
    var themeValue: ThemePrimaryKey { get set }
}
@IBDesignable
extension UIButton {

    var themeValue: ThemePrimaryKey {
        return ThemePrimaryKey.none
    }
    @IBInspectable
    var themePrimaryKey: String {
        get {
            return themeValue.rawValue
        }
        set {
            let keyPath = newValue
            print("keypath: \(keyPath)")
            
            self.theme_backgroundColor = ThemeColorPicker(keyPath: "\(keyPath).backgroundColor")
            self.theme_setTitleColor(ThemeColorPicker(keyPath: "\(keyPath).titleColor"), forState: .normal)
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
