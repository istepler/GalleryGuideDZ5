//
//  WorkVO.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 03.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import ObjectMapper


struct WorkVO: Mappable {
    
    var id: String!
    var title: String?
    var author: String?
    var size: String?
    var type: String?
    var year: Int?
    var imageInfo: WorkImageInfo?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["objectid"]
        title <- map["title"]
        author <- map["author"]
        size <- map["size"]
        type <- map["type"]
        year <- map["year"]
        imageInfo <- map["imgPicture"]
        
    }
        
}

