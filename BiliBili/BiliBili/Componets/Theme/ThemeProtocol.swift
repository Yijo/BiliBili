//
//  ThemeProtocol.swift
//  BiliBili
//
//  Created by Near on 2019/6/28.
//  Copyright © 2019年 Yijo. All rights reserved.
//
import SwiftTheme

protocol Themeable {
    static func setTheme(index: Int)
    static func setTheme(plistName: String, path: ThemePath)
    static func setTheme(dict: Dictionary<String, String>, path: ThemePath)
}

extension Themeable {
    static func setTheme(index: Int) {
        SwiftTheme.ThemeManager.setTheme(index: index)
    }
    
    static func setTheme(plistName: String, path: ThemePath = .mainBundle) {
        SwiftTheme.ThemeManager.setTheme(plistName: plistName, path: getSwiftThemePath(path: path))
    }
    
    static func setTheme(dict: Dictionary<String, String>, path: ThemePath = .mainBundle) {
        SwiftTheme.ThemeManager.setTheme(dict: dict as NSDictionary, path: getSwiftThemePath(path: path))
    }
}

private extension Themeable {
    static func getSwiftThemePath(path: ThemePath) -> SwiftTheme.ThemePath {
        switch path {
        case .mainBundle:
            return SwiftTheme.ThemePath.mainBundle
        case .sandbox(let url):
            return SwiftTheme.ThemePath.sandbox(url)
        }
    }
}
