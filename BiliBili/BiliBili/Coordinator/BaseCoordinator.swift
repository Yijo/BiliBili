//
//  BaseCoordinator.swift
//  BiliBili
//
//  Created by Near on 2019/7/1.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import RxSwift
import Foundation
class BaseCoordinator<ResultType> {
    typealias CoordinationResult = ResultType
    
    let disposeBag = DisposeBag()
    
    private let identifier = UUID()
}
