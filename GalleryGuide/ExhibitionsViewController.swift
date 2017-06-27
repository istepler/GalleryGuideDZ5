//
//  ExhibitionsViewController.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 12.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit


class ExhibitionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var filterView: UIVisualEffectView!
    var exhibitions: [ExhibitionVO] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        filterView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        filterButton.layer.borderWidth = 1.5
        filterButton.layer.cornerRadius = 12
        filterButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 15
        backButton.layer.borderColor = UIColor.white.cgColor
        //button.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { // когда создавать а когда оверрайдить переменную
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exhibitionCell", for: indexPath) as! ExhibitionTVCell
        
        let exhibition = exhibitions[indexPath.row]
        
        cell.galleryNameLabel.text = exhibition.gallery?.name
        cell.exhibitionNameLabel.text = exhibition.name
        cell.exhibitionAuthorLabel.text = exhibition.authorName
        
        
        guard let worksInExhibition = exhibition.works else {
            
            return cell
        }
        
        if !worksInExhibition.isEmpty {
            
            let exhibitionWorkImageName = exhibition.works?[0].imageInfo?.name
            //print(indexPath.row)
            //print(exhibitionWorkImage)
            
            
            
            if let imageName = exhibitionWorkImageName {
                cell.exhibitionWorksImage.image = UIImage(named: imageName)
                
            } else {
                
                cell.exhibitionWorksImage.image = nil // what for shoud we do this, default values?????
            }
            
        }
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! ExhibitionTVCell
        let indexPath = tableView.indexPath(for: cell)
        let index = indexPath?.row
        let destinationVC = segue.destination as! DetailsViewController
        //let image = cell.exhibitionWorksImage.image
        let detailExhibition = ExhibitionsModel.instance.exhibitions[index!]
        destinationVC.detailExhibition = detailExhibition
        
        
        
    }
    @IBAction func popularExhibitionsPressed(_ sender: Any) {
        
        ExhibitionsModel.instance.loadExhibitions(callback: tableView.reloadData, url: .popular)
        filterView.isHidden = true
        
    }
    @IBAction func lastChanceExhibitionPressed(_ sender: Any) {
        ExhibitionsModel.instance.loadExhibitions(callback: tableView.reloadData, url: .lastchance)
        filterView.isHidden = true
    }
    
    @IBAction func openingExhibitionPressed(_ sender: Any) {
        ExhibitionsModel.instance.loadExhibitions(callback: tableView.reloadData, url: .opening)
        filterView.isHidden = true
    }
    
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        //ANIMATE ME
        filterView.isHidden = false
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) { // diference beetween Sender - Any/// Button
        filterView.isHidden = true
        
    }
    
}
