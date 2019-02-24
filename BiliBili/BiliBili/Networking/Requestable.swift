//
//  Requestable.swift
//  BiliBili
//
//  Created by administrator on 2019/2/23.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import PromiseKit
import Moya

enum NetworkError {
    
}


protocol Requestable {
    associatedtype T
    
    init(target: BiliBiliTargetType)
    
    var target: BiliBiliTargetType { get }
    
    var provider: MoyaProvider<BiliBiliTargetType> { get }
    /// Promise
    func toPromise() -> Promise<T>
    
    /// Decode data
    ///
    /// - parameter data: data
    /// - returns: T
    func decode(data: Any) -> T
}


// MARK: Default implementation
extension Requestable {

    /// Reuq
    func toPromise() -> Promise<T> {
        return Promise(resolver: { seal in
            MoyaProvider<LoginAPI>().req
        })
    }
    
    func decode(data: Any) -> T {
        
    }
}
