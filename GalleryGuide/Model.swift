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
    
    func loadExhibitions() {
       
        let  dataLoader = DataLoader()
        exhibitions = dataLoader.loadExhibitions()
        
    }
    
    
}
