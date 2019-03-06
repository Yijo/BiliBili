//
//  Request.swift
//  BiliBili
//
//  Created by administrator on 2019/3/6.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import ObjectMapper

struct Request<Model, APIService> {}

// MARK: - Default implementation
extension Request: Requestable where Model: Mappable, APIService: BiliBiliTargetType {
    
    typealias M = Model
    
    typealias API = APIService
}
