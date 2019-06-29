//
//  TabBarModel.swift
//  BiliBili
//
//  Created by Near on 2019/6/29.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import ObjectMapper

struct TabBarChildModel: Mappable {
    var page: String = ""
    var title: String = ""
    var image: String = ""
    var selectedImage: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        page <- map["page"]
        title <- map["title"]
        image <- map["image"]
        selectedImage <- map["selected_image"]
    }
}
