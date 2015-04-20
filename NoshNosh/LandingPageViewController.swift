//
//  ViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/4/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

//TODO download all the data in the first landing page

class LandingPageViewController: UIViewController {
    
    @IBOutlet weak var restaurantsButton: UIButton!
    @IBOutlet weak var drinksDishesButton: UIButton!
    @IBOutlet weak var eventsSpecialsButton: UIButton!
    @IBOutlet weak var surpriseMeButton: UIButton!
    
    let themeColor = UIColor(rgb: 0x4f9cd9)
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let restaurantURL = "http://noshfolio.com/restaurants/1.json"
    let eventsURL = "http://noshfolio.com/events.json"
    var i = 0
    var j = 0
    var k = 0
    var rItems = [(String, String, String, String)]()
    //var eItems = [(]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //network call to Restaurants
        DataManager.getDataFromNoshfolioWithSuccess(restaurantURL, success: {(NoshData)  -> Void in
            
            let json = JSON(data: NoshData)
            let dict = json.dictionaryValue
            let addresses = dict["addresses"]!.arrayValue

            var name : String = dict["name"]!.stringValue
            var cuisine : String = dict["cuisine"]!.stringValue
            var location : String = addresses[0]["city"].stringValue
            var imgURL : String = dict["events_image"]!["url"].stringValue
            //TODO WHEN API IS READY
//            dict["addresses"]
            
//            let array = json.arrayValue
//
//            for Dict in array{
//                var title : String = array[self.i]["title"].stringValue
//                var kind : String = array[self.i]["kind"].stringValue
//                var description : String = array[self.i]["description"].stringValue
//                var restaurant : String = array[self.i]["eventable"]["name"].stringValue
//                var imageURL : String = array[self.i]["eventable"]["events_image"]["url"].stringValue
//                self.i++
//                
//            }
            self.rItems.append((name, location, imgURL, cuisine))
            
            if let moc = self.managedObjectContext {
                
                // Loop through, creating items
                for (itemName, itemLocation,itemDefaultImg, itemCuisine) in self.rItems {
                    // Create an individual item
                    RestaurantItem.createInManagedObjectContext(moc,
                        name: itemName, location: itemLocation, defaultImg: itemDefaultImg, cuisine: itemCuisine)
                }
            }
            
        })
        
        
        restaurantsButton.setTitle("Restaurants", forState: .Normal)
        drinksDishesButton.setTitle("Drinks and Dishes", forState: .Normal)
        eventsSpecialsButton.setTitle("Events and Specials", forState: .Normal)
        surpriseMeButton.setTitle("Surprise Me!", forState: .Normal)
    
        restaurantsButton.layer.cornerRadius = 6.0
        drinksDishesButton.layer.cornerRadius = 6.0
        eventsSpecialsButton.layer.cornerRadius = 6.0
        surpriseMeButton.layer.cornerRadius = 6.0
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

