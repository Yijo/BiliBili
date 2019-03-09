//
//  LoginViewProtocol.swift
//  BiliBili
//
//  Created by administrator on 2019/3/8.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

// MARK: - View

// Presenter -> View
protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
}

// MARK: - Router

// Presenter -> Router
protocol LoginRouterProtocol {
    static func createLoginModule() -> UIViewController
    
    func presentAddLoginScreen(from view: LoginViewProtocol)
}

// MARK: - Presenter

// View -> Presenter
protocol LoginPresenterProtocol {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginRouterProtocol? { get set }
    func viewDidLoad()
    
    func sign(from view: LoginViewProtocol)
    func register(from view: LoginViewProtocol)
    func forgotPassword(from view: LoginViewProtocol)
    func cancel(from view: LoginViewProtocol)
}

// MARK: - Interactor

// Presenter -> Interactor
protocol LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol? { get set }
    var localDatamanager: LoginLocalDataManagerInputProtocol? { get set }
}

// Interactor -> Presenter
protocol LoginInteractorOutputProtocol {
    
}



// MARK: - DataManager

// Interactor -> LocalDataManager
protocol LoginLocalDataManagerInputProtocol {
    
}
