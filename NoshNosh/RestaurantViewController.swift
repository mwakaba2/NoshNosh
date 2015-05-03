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
    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    
    var item : RestaurantItem?
    var latitude : NSString?
    var longitude : NSString?
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var defaultImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var openNow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = self.item
        self.defaultImg.image = convertImgURLToImg(item!.defaultImg)
        self.nameLabel.text = item?.name
        self.locationLabel.text  = item?.location
        self.detailsLabel.text  = item?.details
        self.cuisineLabel.text  = item?.cuisine
        if(item?.open == "true"){
            self.openNow.text = "Open"
            self.openNow.textColor = green
        }else{
            self.openNow.text = "Closed"
            self.openNow.textColor = red
        }
        // Do any additional setup after loading the view.
        var locationManager = LocationManager.sharedInstance
        
        locationManager.geocodeAddressString(address: item!.location) { (geocodeInfo,placemark,error) -> Void in
            
            if(error != nil){
                
                println(error)
            }else{
                
                println(geocodeInfo!)
                var dict: NSDictionary = geocodeInfo!
               
                self.latitude = dict["latitude"] as! NSString
                self.longitude = dict["longitude"] as! NSString
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "location"{
            var mapViewController : MapViewController = segue.destinationViewController as! MapViewController
            
            mapViewController.latitude = latitude!
            mapViewController.longitude = longitude!
            mapViewController.name = item!.name
            mapViewController.location = item!.location
            
        }
    }
    
}
