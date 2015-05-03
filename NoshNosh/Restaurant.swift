//
//  Restaurant.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/8/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// Retreive the managedObjectContext from AppDelegate
let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
let restaurantURL = "http://noshfolio.com/restaurants/show_n.json?count=20"
var i = 0
var rItems = [(String, String, String, String, String, String, String, String)]()


func loadRestaurants(){
    //network call to Restaurants
    DataManager.getDataFromNoshfolioWithSuccess(restaurantURL, success: {(NoshData)  -> Void in
        
        let json = JSON(data: NoshData)
        let array = json.arrayValue
        
        for Dict in array {
            
            if(array[i]["cuisine"].stringValue != ""){
                var id : String = array[i]["id"].stringValue
                var openURL : String = "http://noshfolio.com/restaurants/\(id)/am_i_open.json"
                var imgURL : String = "http://noshfolio.com/restaurants/\(id)/default_image_url.json"
                var open : String = NSString(data: DataManager.getJSONObject(openURL), encoding: NSUTF8StringEncoding)! as String
                var ImgURL : String = NSString(data: DataManager.getJSONObject(imgURL), encoding: NSUTF8StringEncoding)! as String
                var name : String = array[i]["name"].stringValue
                var cuisine : String = array[i]["cuisine"].stringValue
                var details : String = array[i]["teaser"].stringValue
                var location : String = array[i]["address"].stringValue
                var priority : String = array[i]["owners_recommendations"][0]["restaurant_priority"].stringValue
                
                i++
                rItems.append((name, location, ImgURL, cuisine, details, priority, id, open))
            }
            else{
                i++
            }
        }
        
        if let moc = managedObjectContext {
            
            // Loop through, creating items
            for (itemName, itemLocation,itemDefaultImg, itemCuisine, itemDetails, itemPriority, itemRestaurantID, itemOpen) in rItems {
                // Create an individual item
                RestaurantItem.createInManagedObjectContext(moc,
                    name: itemName, location: itemLocation, defaultImg: itemDefaultImg, cuisine: itemCuisine, details:itemDetails, priority: itemPriority, restaurantID: itemRestaurantID, open: itemOpen)
            }
        }
        
    })
    
}