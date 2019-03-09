//
//  LoginViewController.swift
//  BiliBili
//
//  Created by administrator on 2019/3/9.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登陆"
        
       
        print("This is LoginViewController.")
        // Do any additional setup after loading the view.
    }
}

// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    @IBAction func didOnClickForgotPasswordButton(_ sender: UIBarButtonItem) {
        presenter?.sign(from: self)
    }
    
    @IBAction func didOnClickCancelButton(_ sender: UIBarButtonItem) {
        presenter?.cancel(from: self)
    }
}
