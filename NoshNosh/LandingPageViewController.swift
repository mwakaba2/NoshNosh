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
    var rItems = [(String, String, String, String, String, String, String, String)]()
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
            let array = json.arrayValue
            
            for Dict in array {
                var id : String = array[self.i]["id"].stringValue
                var openURL : String = "http://noshfolio.com/restaurants/\(id)/am_i_open.json"
                var imgURL : String = "http://noshfolio.com/restaurants/\(id)/default_image_url.json"
                var open : String = NSString(data: DataManager.getJSONObject(openURL), encoding: NSUTF8StringEncoding)! as String
                var ImgURL : String = NSString(data: DataManager.getJSONObject(imgURL), encoding: NSUTF8StringEncoding)! as String
                var name : String = array[self.i]["name"].stringValue
                var cuisine : String = array[self.i]["cuisine"].stringValue
                var details : String = array[self.i]["teaser"].stringValue
                var location : String = array[self.i]["address"].stringValue
                var priority : String = array[self.i]["owners_recommendations"][0]["restaurant_priority"].stringValue
                
                self.i++
                self.rItems.append((name, location, ImgURL, cuisine, details, priority, id, open))
            }
            
            if let moc = self.managedObjectContext {
                
                // Loop through, creating items
                for (itemName, itemLocation,itemDefaultImg, itemCuisine, itemDetails, itemPriority, itemRestaurantID, itemOpen) in self.rItems {
                    // Create an individual item
                    RestaurantItem.createInManagedObjectContext(moc,
                        name: itemName, location: itemLocation, defaultImg: itemDefaultImg, cuisine: itemCuisine, details:itemDetails, priority: itemPriority, restaurantID: itemRestaurantID, open: itemOpen)
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
                var startTime : String = array[self.j]["start_time"].stringValue
                var endTime: String = array[self.j]["end_time"].stringValue
                var date: String = array[self.j]["post_time"].stringValue
                var duration = durationStringFromTimeString(startTime, endTime)
                var readableDate = convertToReadableDate(date)
                var id : String = array[self.j]["id"].stringValue
                var url : String = "http://noshfolio.com/events/\(id)/default_image_url.json"
                var eventImage: String = NSString(data: DataManager.getJSONObject(url), encoding: NSUTF8StringEncoding)! as String
                
                self.j++
                self.eItems.append(( title, duration, restaurant, kind, eventImage, description, readableDate, id))
                
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

