//
//  WorkVO.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 03.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation


struct WorkVO: ParseObject {
    
    var id: String!
    var title: String?
    var author: String?
    var size: String?
    var type: String?
    var year: Int?
        
    func parseObject() -> [String : WorkVO] {
         var result:[String:WorkVO] = [:]
        let dataLoader = DataLoader()
       
        let worksArray = dataLoader.loadData(forResource: "works")
        
        
        for workDictionary in worksArray {
            
            let work = WorkVO(
                id: workDictionary["_id"] as! String,
                title: workDictionary["title"] as? String,
                author: workDictionary["author"] as? String,
                size: workDictionary["size"] as? String,
                type: workDictionary["type"] as? String,
                year: workDictionary["year"] as? Int
            )
            
            result[work.id] = work
            
            
            
        }

        return result
    }

}

