//
//  WorkDetailViewController.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 21.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class WorkDetailViewController: UIViewController {
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    
    @IBOutlet weak var workImageView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var workNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var workTypeLabel: UILabel!
    @IBOutlet weak var workSizeLabel: UILabel!
    
    
    var work = WorkVO()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareButton.layer.borderWidth = 1.5
        shareButton.layer.cornerRadius = 30
        shareButton.layer.borderColor = UIColor.white.cgColor
        
        contactButton.layer.borderWidth = 1.5
        contactButton.layer.cornerRadius = 30
        contactButton.layer.borderColor = UIColor.white.cgColor
        
        
        workImageView.image = UIImage(named: work.imageName!)
        authorLabel.text = work.author
        workNameLabel.text = work.title
        if let year = work.year {
        yearLabel.text = String(year)
        }
        if let type = work.type {
            workTypeLabel.text = type
        }
        if let size = work.size {
            workSizeLabel.text = size
        }
        
       
        
        
      
        
        
    }

   
}
