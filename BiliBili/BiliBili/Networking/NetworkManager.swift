//
//  NetworkManager.swift
//  BiliBili
//
//  Created by Near on 2019/2/23.
//  Copyright © 2019年 Yijo. All rights reserved.
//


import ObjectMapper
import Moya
/// Network manager.
struct NetworkManager {
    static let shared = NetworkManager()
    private init() {}
}

// Generate
private extension NetworkManager {
    func generateProvide<API: BiliBiliTargetType>() -> MoyaProvider<API> {
        return MoyaProvider<API>(plugins: [NetworkActivityPlugin(networkActivityClosure: { type, _ in
            switch type {
            case .began:
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            case .ended:
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        })])
    }
}


extension NetworkManager {
    
}
