//
//  UIView+LoadXib.swift
//  BiliBili
//
//  Created by Near on 2019/6/28.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

protocol NibLoadable {
}

extension NibLoadable where Self: UIView {
    static func loadFromNib(_ nibName: String? = nil) -> Self {
        let loadName = nibName ?? "\(self)"
        guard let loadView = Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as? Self else {
            
            return Bundle.main.loadNibNamed("DefaultEmpty", owner: nil, options: nil)?.first as! Self
        }
        return loadView
    }
}

extension UIView: NibLoadable {
}

