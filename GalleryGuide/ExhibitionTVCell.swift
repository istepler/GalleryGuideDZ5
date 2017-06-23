//
//  ExhibitionTVCell.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 13.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ExhibitionTVCell: UITableViewCell {
    
    @IBOutlet weak var exhibitionWorksImage: UIImageView!
    @IBOutlet weak var galleryNameLabel: UILabel!
    @IBOutlet weak var exhibitionNameLabel: UILabel!
    @IBOutlet weak var exhibitionAuthorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
