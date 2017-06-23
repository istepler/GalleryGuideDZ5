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

    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.layer.borderWidth = 1.5
        shareButton.layer.cornerRadius = 30
       shareButton.layer.borderColor = UIColor.white.cgColor
        
        contactButton.layer.borderWidth = 1.5
        contactButton.layer.cornerRadius = 30
        contactButton.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
