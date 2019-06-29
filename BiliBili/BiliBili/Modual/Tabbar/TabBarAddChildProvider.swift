//
//  TabBarAddChildProvider.swift
//  BiliBili
//
//  Created by Near on 2019/6/29.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
import ObjectMapper

fileprivate typealias JSONResponse = [String: String]

struct TabBarAddChildProvider {
    var childControllers: [UIViewController]
    
    init() {
        
        childControllers = []
        
        childControllers = self.getChildControllers()
    }
    
    private lazy var defaultChildInfos: [JSONResponse] = {
        let infos: [JSONResponse] = [
        [
            "page": "HomeController",
            "title": "首页",
            "image": "",
            "selected_image": "",
            ],
        [
            "page": "ChannelController",
            "title": "频道",
            "image": "",
            "selected_image": "",
            ],
        [
            "page": "TrendController",
            "title": "动态",
            "image": "",
            "selected_image": "",
            ],
        [
            "page": "PurchaseController",
            "title": "会员购",
            "image": "",
            "selected_image": "",
            ],
        [
            "page": "MineController",
            "title": "我的",
            "image": "",
            "selected_image": "",
            ]
        ]
        return infos
    }()
}

private extension TabBarAddChildProvider {
    mutating func getChildControllers() -> [UIViewController] {
        let path = Bundle.main.path(forResource: "menu", ofType: ".json")
        do {
            let url = URL(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
            let infos = json["tabbar_items"] as! [JSONResponse]
            return getDefaultChild(infos)
        } catch {
            // TODO: load failed, record log.
            print("error: \(error)")
            
            return getDefaultChild()
        }
    }
    
    mutating func getDefaultChild(_ infos: [JSONResponse]? = nil) -> [UIViewController] {
        var childs: [UIViewController] = []
        let childrenInfos = infos ?? defaultChildInfos
        do {
            // load name space
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as! String
            for info in childrenInfos {
                let model = Mapper<TabBarChildModel>().map(JSON: info)!
                let clsName = "\(namespace).\(model.page)"
                let cls = NSClassFromString(clsName) as! UIViewController.Type
                
                let vc = cls.init()
                vc.title = model.title
                let tabbarItem = UITabBarItem(title: model.title, image: UIImage(named: model.image), selectedImage: UIImage(named: model.selectedImage))
                
                vc.tabBarItem = tabbarItem
                let nav = NavigationController(rootViewController: vc)
                childs.append(nav)
            }
        } catch {
            // TODO: load failed, record log.
            print("TabBarController add child failed, error is \(error)")
        }
        
        return childs
    }
}
