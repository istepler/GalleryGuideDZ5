//
//  DetailsViewController.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 14.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var aboutGalleryTextField: UITextView!
    
    @IBOutlet weak var worksCollectionView: UICollectionView!
    
    @IBOutlet weak var mainStackView: UIStackView!
   
        
    @IBOutlet weak var galleryDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worksCollectionView.delegate = self
        worksCollectionView.dataSource = self
        mainStackView.subviews[2].isHidden = true
        
        aboutGalleryTextField.text = "yvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhviyvyhvi"
    
       // datailImageView.image = detailImage
        self.navigationController?.navigationBar.topItem?.title = ""
    
        
    }
    
        // print(datailImageView)
       //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { // когда создавать а когда оверрайдить переменную
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExhibitionsModel.instance.exhibitions[0].works!.count
    }
    
    
     //The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = worksCollectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as! WorkCollectionViewCell
        cell.workImage.image = UIImage(named: (ExhibitionsModel.instance.exhibitions[2].works?[indexPath.row].imageName)!)///
        return cell
    }

    @IBAction func GaleryDetailButtonPressed(_ sender: UIButton) {
        if mainStackView.subviews[2].isHidden == false {
            mainStackView.subviews[2].isHidden = true
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi))
        } else {
            mainStackView.subviews[2].isHidden = false
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi))
        }
       
        
    }
    
    
}
