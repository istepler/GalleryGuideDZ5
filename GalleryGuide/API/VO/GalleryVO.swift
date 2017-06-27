//
//  GalleryVO.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import ObjectMapper

struct GalleryVO: Mappable {
    
    var id:String!
    var name:String!
    var galleryDescription:String?
    var email:String?
    var facebook:String?
    var city:String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["id"]
        galleryDescription <- map["galleryDescription"]
        email <- map["email"]
        facebook <- map["facebook"]
        city <- map["city"]
        
    }
}
