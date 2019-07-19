//
//  LoginAPI.swift
//  BiliBili
//
//  Created by Near on 2019/2/24.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import Moya

enum LoginAPI {
    case getCaptcha(account: String, style: Int)
    case register(account: String, password: String, captcha: String, style: Int)
    case signIn(account: String, password: String)
    case signOut
}

extension LoginAPI: BiliBiliTargetType {
    var method: Moya.Method {
        switch self {
        case .register,.signIn, .signOut:
            return .post
        default:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case let .signIn(account, password):
            return ["account": account, "password": password]
        default:
            return nil
        }
    }
    
    var parameterEncode: ParameterEncoding {
        switch self {
        case .register,.signIn, .signOut:
            return URLEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        switch self {
        case let .signIn(account, password):
            return .requestParameters(parameters: ["account": account, "password": password], encoding: parameterEncode)
        default:
            return .requestPlain
        }
    }
    
    var path: String {
        switch self {
        case .getCaptcha:
            return "4/news/latest"
        case .register:
            return ""
        case .signIn:
            return ""
        case .signOut:
            return ""
        default:
            return ""
        }
    }
}

