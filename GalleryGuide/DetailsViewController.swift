//
//  DetailsViewController.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 14.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var detailExhibition: ExhibitionVO?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var galleryNameLabel: UILabel!
    @IBOutlet weak var sheduleLabel: UILabel!
    @IBOutlet weak var galleryAdressLabel: UILabel!
    @IBOutlet weak var galleryPhoneLabel: UILabel!
    @IBOutlet weak var galleryWebLabel: UILabel!
    @IBOutlet weak var aboutExhibitionTextView: UITextView!
    @IBOutlet weak var aboutArtistTextView: UITextView!
    @IBOutlet weak var linksTextView: UITextView!
    
    
    
    @IBOutlet weak var aboutGalleryTextField: UITextView!
    @IBOutlet weak var worksCollectionView: UICollectionView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var galleryDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worksCollectionView.delegate = self
        worksCollectionView.dataSource = self
        mainStackView.subviews[2].isHidden = true
        
        aboutGalleryTextField.text = detailExhibition!.gallery?.galleryDescription
        titleLabel.text = detailExhibition!.name
        authorLabel.text = detailExhibition!.authorName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
//        datesLabel.text = dateFormatter.string(from:detailExhibition!.startDate!) + " - " +  dateFormatter.string(from:detailExhibition!.endDate!)
        galleryNameLabel.text = detailExhibition!.gallery?.name
        sheduleLabel.text = "don't forget"
        galleryAdressLabel.text = detailExhibition!.gallery?.city
        galleryPhoneLabel.text = "don't forget"
        galleryWebLabel.text = detailExhibition!.gallery?.email
        aboutExhibitionTextView.text = detailExhibition!.about
        aboutArtistTextView.text = detailExhibition!.authorDescription
        linksTextView.text = "Dont forget abour WEB site"
        
    
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
        return detailExhibition!.works!.count
    }
    
    
     //The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = worksCollectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as! WorkCollectionViewCell
        // TO DO LOAD IMAGES WITH SD WEB IMAGE
       cell.workImage.image = UIImage(named: (detailExhibition!.works![indexPath.row].imageInfo?.name!)!)///
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = worksCollectionView.indexPath(for: cell)
        let index = indexPath!.row
        let destinationVC = segue.destination as! WorkDetailViewController
        destinationVC.work = (detailExhibition?.works?[index])!
        
        
        
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
