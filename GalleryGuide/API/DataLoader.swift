//
//  DataLoader.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation


extension Date {
    static func from(string:String?) -> Date? {
        
        guard let string = string else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        return dateFormatter.date(from: string)
    }
}
//
//class DataLoader {
//    
//    //    func load<T: Parsable> (filename: String) -> T {
//    //        var result:
//    //
//    //   }
//    
//    
//    
//    func loadExhibitions() -> [ExhibitionVO]  {
//        
//        
//        let galleries = loadGalleries()
//        let allWorks = loadWorks()
//        
//        var result:[ExhibitionVO] = []
//        
//        
//        
//        
//        let exhibitionArray = loadData(forResource: "exhibitions")
//        
//        for exhibitionDictionary in exhibitionArray {
//            
//            
//            var works: [WorkVO] = []
//            
//            let worksArray = exhibitionDictionary["works"] as? [[String:String]]
//            
//            if let worksArray = worksArray  {
//                
//                for work in worksArray {
//                    
//                    if let workID = work["objectId"] {
//                        if let newWork = allWorks[workID] {
//                            works.append(newWork)
//                        }
//                    }
//                }
//            }
//            var galleryID:String = exhibitionDictionary["_p_gallery"] as! String
//            galleryID = galleryID.components(separatedBy: "$").last!
//            
//            if let gallery = galleries[galleryID] {
//                
//                var exhibition = ExhibitionVO()
//                exhibition.parse(json: exhibitionDictionary)
//                
//                exhibition.gallery = gallery
//                exhibition.works = works
//                
//                
//                
//                result.append(exhibition) /// chek for optional
//                
//              
//                
//            }
//        }
//        
//        return result
//    }
//    
//    func loadGalleries() -> [String: GalleryVO] {
//        
//        var result:[String: GalleryVO] = [:]
//        
//        let galleriesArray = loadData(forResource: "galleries")
//        
//        for galleryDictionary in galleriesArray {
//            
//            var gallery = GalleryVO()
//            gallery.parse(json: galleryDictionary)
//            
//            result[gallery.id] = gallery
//        }
//        
//        return result
//        
//    }
//    
//    func loadWorks() -> [String:WorkVO] {
//        
//        var result:[String:WorkVO] = [:]
//        
//        let worksArray = loadData(forResource: "works")
//        
//        for workDictionary in worksArray {
//            
//            var work = WorkVO()
//            work.parse(json: workDictionary)
//            result[work.id] = work
//            
//        }
//        
//        return result
//        
//    }
//    
//    
//    func loadData(forResource: String) ->  [[String: Any]] {
//        
//        var result: [[String: Any]] = [[:]]
//        
//        guard let url = Bundle.main.url(forResource: forResource, withExtension: "json") else {
//            return result
//        }
//        
//        guard let rawData = try? Data(contentsOf: url) else {
//            return result
//        }
//        
//        guard let rawArray = try? JSONSerialization.jsonObject(with: rawData) as? [[String: Any]] else {
//            return result
//        }
//        if let rawArray = rawArray {
//            result = rawArray
//        }
//        return result
//    }
//}
//
//protocol Parsable {
//    mutating func parse(json: [String: Any])
//}
//
//
//extension GalleryVO: Parsable {
//    
//    mutating func parse(json: [String : Any]) {
//        self.id = json["_id"] as? String
//        self.name = json["name"] as? String
//        self.galleryDescription = json["galleryDescription"] as? String
//        self.email = json["email"] as? String
//        self.facebook = json["facebook"] as? String
//        self.city = json["city"] as? String
//        
//    }
//}
//
//extension WorkVO: Parsable {
//    
//    mutating func parse(json: [String : Any]) {
//        self.id = json["_id"] as! String
//        self.title = json["title"] as? String
//        self.author = json["author"] as? String
//        self.size = json["size"] as? String
//        self.type = json["type"] as? String
//        self.year = json["year"] as? Int
//       // self.imageName = json["imgPicture"] as? String
//        
//    }
//    
//    
//}
//
//extension ExhibitionVO: Parsable {
//
//   mutating func parse(json: [String : Any]) {
//    
//    
//        self.id = json["_id"] as? String
//        self.name = json["name"] as? String ////// the problem was here, when the name: String in structure
//        self.about = json["about"] as? String
//        self.authorName = json["authorName"] as? String
//        self.authorDescription = json["authorDescription"] as? String
//        self.startDate = Date.from(string: json["dateStart"] as? String)
//        self.endDate = Date.from(string: json["dateEnd"] as? String)
//        self.gallery = nil
//       self.works = nil
//        
//
//    }
//    
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
