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
    let restaurantURL = "http://noshfolio.com/restaurants/1.json"
    let eventsURL = "http://noshfolio.com/events.json"
    var i = 0
    var j = 0
    var k = 0
    var rItems = [(String, String, String, String)]()
    var eItems = [(String, String, String, String,String, String, String, String)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Downloading NoshData...")
        PKHUD.sharedHUD.show()

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
                    var image = convertImgURLToImg(imageURL)
                } else  {
                    imageURL = array[self.j]["eventable"]["events_image"]["url"].stringValue
                    var image = convertImgURLToImg(imageURL)
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

