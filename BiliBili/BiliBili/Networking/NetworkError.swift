//
//  NetworkError.swift
//  BiliBili
//
//  Created by Near on 2019/6/27.
//  Copyright © 2019年 Yijo. All rights reserved.
//

enum NetworkError: Error {
    case mapperJSONError
    case parseJSONError
    case otherError
    case requestOperationError(message: String)
}

extension NetworkError {
    var localizedDescription: String {
        switch self {
        case .mapperJSONError:
            return "Mapper to json error."
        case .parseJSONError:
            return "Parse json error."
        case let .requestOperationError(message):
            return message.isEmpty ? "Operation error after request success." : message
        default:
            return "Other error."
        }
    }
}
