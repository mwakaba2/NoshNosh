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
    
    let themeColor = UIColor(rgb: 0x4f9cd9)
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let restaurantURL = "http://noshfolio.com/restaurants/show_n.json?count=20"
    let eventsURL = "http://noshfolio.com/events.json"
    var i = 0
    var j = 0
    var k = 0
    var rItems = [(String, String, String, String, String, String)]()
    var eItems = [(String, String, String, String,String, String, String, String)]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Downloading NoshData...")
        PKHUD.sharedHUD.show()

        loadRestaurants()
        loadEvents()
        
    }
    

    func loadRestaurants(){
        //network call to Restaurants
        DataManager.getDataFromNoshfolioWithSuccess(restaurantURL, success: {(NoshData)  -> Void in
            
            let json = JSON(data: NoshData)
            //            let dict = json.dictionaryValue
            //            let addresses = dict["addresses"]!.arrayValue
            //
            //            var name : String = dict["name"]!.stringValue
            //            var cuisine : String = dict["cuisine"]!.stringValue
            //            var location : String = addresses[0]["city"].stringValue
            //            var imgURL : String = dict["events_image"]!["url"].stringValue
            //TODO WHEN API IS READY
            
            let array = json.arrayValue
            
            for Dict in array {
                var name : String = array[self.i]["name"].stringValue
                var cuisine : String = array[self.i]["cuisine"].stringValue
                var open : Bool = true
                var details : String = array[self.i]["teaser"].stringValue
                var location : String = array[self.i]["address"].stringValue
                var imageURL : String = array[self.i]["images"][0]["url"].stringValue
                var priority : String = array[self.i]["owners_recommendations"][0]["restaurant_priority"].stringValue
                self.i++
                self.rItems.append((name, location, imageURL, cuisine, details, priority))
            }
            
            if let moc = self.managedObjectContext {
                
                // Loop through, creating items
                for (itemName, itemLocation,itemDefaultImg, itemCuisine, itemDetails, itemPriority) in self.rItems {
                    // Create an individual item
                    RestaurantItem.createInManagedObjectContext(moc,
                        name: itemName, location: itemLocation, defaultImg: itemDefaultImg, cuisine: itemCuisine, details:itemDetails, priority: itemPriority)
                }
            }
            
        })
        
    }
    
    func loadEvents(){
        DataManager.getDataFromNoshfolioWithSuccess(eventsURL, success: {(NoshData)  -> Void in
            
            let json = JSON(data: NoshData)
            let array = json.arrayValue
            
            for Dict in array{
                var title : String = array[self.j]["title"].stringValue
                var kind : String = array[self.j]["kind"].stringValue
                var description : String = array[self.j]["description"].stringValue
                var restaurant : String = array[self.j]["eventable"]["name"].stringValue
                var imageURL : String = array[self.j]["eventable"]["images"][0]["url"].stringValue
                if(array[self.j]["eventable"]["events_image"]["url"] == "/images/fallback/default.png"){
                    imageURL = array[self.j]["eventable"]["images"][0]["url"].stringValue
                } else  {
                    imageURL = array[self.j]["eventable"]["events_image"]["url"].stringValue
                }
                var startTime : String = array[self.j]["start_time"].stringValue
                var endTime: String = array[self.j]["end_time"].stringValue
                var date: String = array[self.j]["post_time"].stringValue
                var duration = durationStringFromTimeString(startTime, endTime)
                var readableDate = convertToReadableDate(date)
                var id : String = array[self.j]["eventable"]["id"].stringValue
                
                
                self.j++
                self.eItems.append(( title, duration, restaurant, kind, imageURL, description, readableDate, id))
                
            }
            if let moc = self.managedObjectContext {
                
                // Loop through, creating items
                for (itemTitle ,itemTime, itemLocation, itemKind, itemImageURL, itemDetails, itemDate, itemID) in self.eItems {
                    // Create an individual item
                    EventSpecItem.createInManagedObjectContext(moc,
                        title: itemTitle, time: itemTime, location: itemLocation,  kind: itemKind, imgURL: itemImageURL, details: itemDetails, date: itemDate, restaurantID: itemID)
                }
            }
            PKHUD.sharedHUD.hide(animated: false)
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

