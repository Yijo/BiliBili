//
//  BiliBiliTargetType.swift
//  BiliBili
//
//  Created by Near on 2019/2/24.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import Moya

protocol BiliBiliTargetType: TargetType {
    /// Parameters
    var parameters: [String: Any]? { get }
    
    /// Parameter encode.
    var parameterEncode: ParameterEncoding { get }
}

// MARK: Default implementation
extension BiliBiliTargetType {
    var baseURL: URL { return URL(string: "http://news-at.zhihu.com/api/")! }
    
    var path: String { return "" }
    
    var method: Method { return .get }
    
    var task: Task { return .requestPlain }
    
    var sampleData: Data {
        return "This is sample data".data(using: .utf8)!
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String: Any]? { return nil }
    
    var parameterEncode: ParameterEncoding { return URLEncoding.default }
}
