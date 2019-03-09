//
//  LoginRouter.swift
//  BiliBili
//
//  Created by administrator on 2019/3/8.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    static func createLoginModule() -> UIViewController {
        let lg = LoginViewController()
        let nav = UINavigationController(rootViewController: lg)
        
        if let view = nav.children.first as? LoginViewController {
            
//            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter
            
            return nav
        }
        
        return UIViewController()
    }
    
    
    
    func presentAddLoginScreen(from view: LoginViewProtocol) {
        
    }
}
