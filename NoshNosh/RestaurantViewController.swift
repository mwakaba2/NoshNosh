//
//  RestaurantViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/15/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

class RestaurantViewController: UIViewController {
    // Retreive the managedObjectContext from AppDelegate
    
    var item : RestaurantItem?
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var defaultImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = self.item
        self.defaultImg.image = convertImgURLToImg(item!.defaultImg)
        self.nameLabel.text = item?.name
        self.locationLabel.text  = item?.location
        self.detailsLabel.text  = item?.details
        self.cuisineLabel.text  = item?.cuisine
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
