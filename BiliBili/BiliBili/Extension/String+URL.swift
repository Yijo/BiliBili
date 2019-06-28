//
//  String+URL.swift
//  BiliBili
//
//  Created by Near on 2019/6/27.
//  Copyright © 2019年 Yijo. All rights reserved.
//

extension String {
    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
