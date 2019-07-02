//
//  ThemePath.swift
//  BiliBili
//
//  Created by Near on 2019/7/2.
//  Copyright © 2019年 Yijo. All rights reserved.
//
import Foundation

enum ThemePath {
    case mainBundle
    case sandbox(Foundation.URL)
    
    var URL: Foundation.URL? {
        switch self {
        case .mainBundle: return nil
        case .sandbox(let path): return path
        }
    }
    
    func plistPath(name: String) -> String? {
        switch self {
        case .mainBundle:
            return Bundle.main.path(forResource: name, ofType: "plist")
        case .sandbox(let path):
            let name = name.hasSuffix(".plist") ? name : name + ".plist"
            return Foundation.URL(string: name, relativeTo: path)?.path
        }
    }
}
