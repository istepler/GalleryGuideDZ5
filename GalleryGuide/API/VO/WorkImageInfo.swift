//
//  WorkImageInfo.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 25.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import ObjectMapper


struct WorkImageInfo: Mappable {
    var name: String?
    var url: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map){
        name <- map["name"]
        url <- map["url"]
    }
    
}
