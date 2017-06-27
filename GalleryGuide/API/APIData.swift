//
//  APIData.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 25.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIDataLoader {
    
    //var exhibitionsArray = [ExhibitionVO]() WHY I CANT DO IT HEAR
   
    
    func makeRequest( callback: @escaping ()-> Void, url: URLList){ // request
        
        Alamofire.request(url.rawValue).responseArray { // weak self????
            (response: DataResponse<[ExhibitionVO]>) in
            
            switch response.result {
            case .success(let result):
                print("!!!!!!!!!!!!!!!!!!!!")
                ExhibitionsModel.instance.saveExhibitions(loadedObjects: result)
                callback() 
            case .failure(let error):
                print("Error: \(error)")
                
            }
            
        }
    //print("-------------")
      // print(exhibitionsArray) /// WHY IS IT EMPTY
    }
    
}

enum URLList: String {
    case opening = "https://gallery-guru-prod.herokuapp.com/exhibitions/opening"
    case all = "https://gallery-guru-prod.herokuapp.com/exhibitions/"
    case lastchance = "https://gallery-guru-prod.herokuapp.com/exhibitions/lastchance"
    case popular = "https://gallery-guru-prod.herokuapp.com/exhibitions/popular"
    
}




