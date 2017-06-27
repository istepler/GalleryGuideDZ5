//
//  ExhibitionVO.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExhibitionVO: Mappable {
    
    
    var id:String?
    var name:String!
    var about:String!
    var authorName:String!
    var authorDescription:String!
    var startDate:Date?
    var endDate:Date?
    var gallery:GalleryVO?
    var works: [WorkVO]?
    
    init?(map: Map) {
        
    }

    mutating func mapping(map: Map) {
        id <- map["objectId"]
        name <- map["name"]
        about <- map["about"]
        authorName <- map["authorName"]
        authorDescription <- map["authorDescription"]
        startDate <- map["dateStart"]
        endDate <- map["dateEnd"]
        gallery <- map["gallery"]
        works <- map["works"]
    }

}
