//
//  Model.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 12.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

class ExhibitionsModel {
    
    static var instance = ExhibitionsModel()
    
    private(set) var exhibitions: [ExhibitionVO] = []
    
    let request = APIDataLoader()
    
    
    
    func saveExhibitions(loadedObjects: [ExhibitionVO]) {
        self.exhibitions = loadedObjects
    }
    
    func loadExhibitions(callback:@escaping () -> Void, url: URLList) {
        let request = APIDataLoader()
        request.makeRequest(callback: callback, url: url)
    }
    
    
}
