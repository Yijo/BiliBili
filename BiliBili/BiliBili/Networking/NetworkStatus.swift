//
//  Model.swift
//  BiliBili
//
//  Created by Near on 2019/3/6.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import ObjectMapper
import Moya
/// Default network model.
struct NetworkStatus: Mappable {
    var code: Int!
    var message: String?
    var data: Any?
    var localMessage: String?
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        code <- map["error_code"]
        message <- map["msg"]
        data <- map["data"]
    }
}
