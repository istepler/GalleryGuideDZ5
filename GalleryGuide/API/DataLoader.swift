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

class DataLoader {
    
    func loadExhibitions() -> [ExhibitionVO]  {
        
        let galleries = loadGalleries()
        let allWorks = loadWorks()
        
        var result:[ExhibitionVO] = []
        
        let exhibitionArray = loadData(forResource: "exhibitions")
        
        for exhibitionDictionary in exhibitionArray {
            
            var works: [WorkVO] = []
            
            let worksArray = exhibitionDictionary["works"] as? Array<[String:String]>
            
            if let worksArray = worksArray  {
                
                for work in worksArray {
                    
                    if let workID = work["objectId"] {
                        if let newWork = allWorks[workID] {
                            works.append(newWork)
                        }
                    }
                }
            }
            var galleryID:String = exhibitionDictionary["_p_gallery"] as! String
            galleryID = galleryID.components(separatedBy: "$").last!
            
            if let gallery = galleries[galleryID] {
                
                let exhibition = ExhibitionVO(
                    id: exhibitionDictionary["_id"] as? String,
                    name: exhibitionDictionary["name"] as! String,
                    about: exhibitionDictionary["about"] as? String,
                    authorName: exhibitionDictionary["authorName"] as? String,
                    authorDescription: exhibitionDictionary["authorDescription"] as? String,
                    startDate: Date.from(string: exhibitionDictionary["dateStart"] as? String),
                    endDate: Date.from(string: exhibitionDictionary["dateEnd"] as? String),
                    gallery: gallery,
                    works: works
                )
                
                result.append(exhibition)
                
            }
        }
        
        return result
    }
    
    private func loadGalleries() -> [String: GalleryVO] {
        
        var result:[String: GalleryVO] = [:]
        
        let galleriesArray = loadData(forResource: "galleries")
        
        for galleryDictionary in galleriesArray {
            
            let gallery = GalleryVO(
                id: galleryDictionary["_id"] as! String,
                name: galleryDictionary["name"] as! String,
                galleryDescription: galleryDictionary["galleryDescription"] as? String,
                email: galleryDictionary["email"] as? String,
                facebook: galleryDictionary["facebook"] as? String,
                city: galleryDictionary["city"] as? String)
            
            result[gallery.id] = gallery
            
        }
        
        return result
    }
    
    private func loadWorks() -> [String:WorkVO] {
        
        var result:[String:WorkVO] = [:]
        
        let worksArray = loadData(forResource: "works")
        
        for workDictionary in worksArray {
            
            let work = WorkVO(
                id: workDictionary["_id"] as! String,
                title: workDictionary["title"] as? String,
                author: workDictionary["author"] as? String,
                size: workDictionary["size"] as? String,
                type: workDictionary["type"] as? String,
                year: workDictionary["year"] as? Int,
                updatedAt: Date.from(string: workDictionary["_created_at"] as? String),
                createdAt: Date.from(string: workDictionary["_updated_at"] as? String)
            )
            
            result[work.id] = work
            
            
            
        }
        
        
        return result
        
    }
    
    private func loadData(forResource: String) ->  [[String: Any]] {
        
        var result: [[String: Any]] = [[:]]
        
        guard let url = Bundle.main.url(forResource: forResource, withExtension: "json") else {
            return result
        }
        
        guard let rawData = try? Data(contentsOf: url) else {
            return result
        }
        
        guard let rawArray = try? JSONSerialization.jsonObject(with: rawData) as? [[String: Any]] else {
            return result
        }
        if let rawArray = rawArray {
            result = rawArray
        }
        return result
    }
}







