//
//  Observable+ObjectMapper+Moya.swift
//  BiliBili
//
//  Created by Near on 2019/6/27.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import RxSwift
import ObjectMapper
import Moya

typealias JSONResponse = [String: Any]

extension ObservableType where E == Response {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            
            let status = try self.getBaseStatusModel(response)
            
            guard let dict = status.data as? JSONResponse else {
                throw NetworkError.mapperJSONError
            }
            guard let mapper = Mapper<T>().map(JSON: dict) else {
                throw NetworkError.parseJSONError
            }
            return mapper
        }
    }

    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            
            let status = try self.getBaseStatusModel(response)
            
            guard let dicts = status.data as? [JSONResponse] else {
                throw NetworkError.mapperJSONError
            }
            return Mapper<T>().mapArray(JSONArray: dicts)
        }
    }
    
    private func getBaseStatusModel(_ response: Response, failsOnEmptyData: Bool = true) throws -> NetworkStatus {
        guard let json = try? response.mapJSON(failsOnEmptyData: true) else {
            throw NetworkError.parseJSONError
        }
        
        let status = Mapper<NetworkStatus>().map(JSONObject: json)
        
        return status!
    }
}
