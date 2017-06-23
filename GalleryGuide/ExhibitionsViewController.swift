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
        
        if !exhibition.works!.isEmpty {
            
            
            let exhibitionWorkImageName = exhibition.works?[0].imageName
            //print(indexPath.row)
            //print(exhibitionWorkImage)
            
            
            cell.exhibitionWorksImage.image = UIImage(named: exhibitionWorkImageName!)
            
        } else {
            
            cell.exhibitionWorksImage.image = nil // what for shoud we do this, default values?????
        }
        
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! ExhibitionTVCell
        let destinationVC = segue.destination as! DetailsViewController
        let image = cell.exhibitionWorksImage.image
       // print(image)
        //destinationVC.detailImage = image
        
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        print(":jgf")
        //ANIMATE ME
        filterView.isHidden = false
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) { // diference beetween Sender - Any/// Button
        filterView.isHidden = true
        
    }
}
