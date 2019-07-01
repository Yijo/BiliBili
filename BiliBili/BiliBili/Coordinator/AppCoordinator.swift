//
//  AppCoordinator.swift
//  BiliBili
//
//  Created by Near on 2019/7/1.
//  Copyright © 2019年 Yijo. All rights reserved.
//
import RxSwift

final class AppCoordinator {
    private var childCoordinators = [Coordinator]()
    
    private var navigationController: UINavigationControllerType?
    
    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationControllerType) {
        self.navigationController = navigationController
    }
}

extension AppCoordinator: Coordinator {
    func start() {
        
    }
}
