//
//  Requestable.swift
//  BiliBili
//
//  Created by administrator on 2019/2/23.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import PromiseKit
import Moya
import ObjectMapper

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


protocol Requestable {
    associatedtype M
    associatedtype API

    /// Promise
    func request(target: API) -> Promise<M>
    
    /// Decode data
    ///
    /// - parameter data: data
    /// - returns: T
    func decode(data: Any) -> M?
}


// MARK: - Default implementation
extension Requestable where API: BiliBiliTargetType, M: Mappable {
    // Moya provide
    var provide: MoyaProvider<API> {
        return MoyaProvider<API>(plugins: [NetworkActivityPlugin(networkActivityClosure: { (type, _) in
            switch type {
            case .began:
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            case .ended:
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        })])
    }
    
    /// Reuquest
    func request(target: API) -> Promise<M> {
        return Promise(resolver: { seal in
            provide.request(target, completion: { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        // Filter error status code
                        let response = try moyaResponse.filterSuccessfulStatusCodes()
                        
                        // Mapper to json
                        guard let json = try response.mapJSON(failsOnEmptyData: true) as? [String: Any] else {
                            seal.reject(NetworkError.mapperJSONError)
                            return
                        }
                        
                        // Validate code
                        guard let code = json["code"] as? Int, code == 0 else {
                            let displayMessage = json["displayMsg"] as? String
                            seal.reject(NetworkError.requestOperationError(message: displayMessage ?? ""))
                            return
                        }
                        
                        // Parse json
                        guard let model = self.decode(data: json) else {
                            seal.reject(NetworkError.parseJSONError)
                            return
                        }
                        
                        seal.fulfill(model)
                    } catch {
                        switch error {
                        default: break
                        }
                        
                        seal.reject(error)
                    }
                case .failure(_):
                    seal.reject(NetworkError.otherError)
                }
            })
        })
    }
    
    func decode(data: Any) -> M? {
        return Mapper<M>().map(JSONObject: data)
    }
}
