//
//  LoadingViewController.swift
//  GalleryGuide
//
//  Created by Andrey Krit on 12.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit


class LoadingViewController: UIViewController {
   
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /* WHAT FOR ARE WE DOING THIS
     
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExhibitionsModel.instance.loadExhibitions(callback: moveNextView, url: .all)
        //print(ExhibitionsModel.instance.exhibitions)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true) ///// DONT FORGET TO ASK
        print("apeared")
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
      
    }

    func moveNextView() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let exhibitionsVC = storyboard.instantiateViewController(withIdentifier: "ExhibitionsViewController") as! ExhibitionsViewController
        exhibitionsVC.exhibitions = ExhibitionsModel.instance.exhibitions
        self.navigationController?.setViewControllers([exhibitionsVC], animated: true)
    }
   
}
