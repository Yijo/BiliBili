//
//  NetworkManager.swift
//  BiliBili
//
//  Created by administrator on 2019/2/23.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import PromiseKit
import ObjectMapper

/// Network manager.
struct NetworkManager {
    static let manager = NetworkManager()
    private init() {}
}

extension NetworkManager {
    func request<M: Mappable, API: BiliBiliTargetType>(target: API) -> Promise<M> {
        return Request<M, API>().request(target: target)
    }

    func upLoad() {}
    
    func downLoad() {}
}
