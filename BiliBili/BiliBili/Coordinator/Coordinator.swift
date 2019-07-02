//
//  Coordinator.swift
//  BiliBili
//
//  Created by Near on 2019/7/1.
//  Copyright © 2019年 Yijo. All rights reserved.
//

protocol Coordinator: class {
//    var childCoordinators: [Coordinator] { get set }
    
    func start()
    
//    init(navigationController: UINavigationControllerType)
}

//extension Coordinator {
//    func addChildCoordinator(childCoordinator: Coordinator) {
//        childCoordinators.append(childCoordinator)
//    }
//    
//    func removeChildCoordinator(childCoordinator: Coordinator) {
//        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
//    }
//}
