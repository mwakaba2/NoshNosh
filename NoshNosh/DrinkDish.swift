//
//  DrinksDishes.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let dishesURL = "http://noshfolio.com/owners_recommendations/show_n.json"
var k = 0
var dItems = [(String, String, String, String, String, String, String)]()


func loadDishes(){
    //network call to Restaurants
    DataManager.getDataFromNoshfolioWithSuccess(dishesURL, success: {(NoshData)  -> Void in
        
        let json = JSON(data: NoshData)
        let array = json.arrayValue
        
        for Dict in array {
            var name : String = array[k]["name"].stringValue
            var ddID : String = array[k]["id"].stringValue
            var ddURL : String = "http://noshfolio.com/owners_recommendations/\(ddID)/default_image_url.json"
            var dishURL : String = NSString(data: DataManager.getJSONObject(ddURL), encoding: NSUTF8StringEncoding)! as String
            var price : String = array[k]["min_price"].stringValue
            var details : String = array[k]["description"].stringValue
            var restaurantID : String = array[k]["restaurant_id"].stringValue
            var priority : String = array[k]["restaurant_priority"].stringValue
            
            k++
            dItems.append((name, price, dishURL, ddID, details, priority, restaurantID))
        }
        
        if let moc = managedObjectContext {
            
            // Loop through, creating items
            for (itemName, itemPrice, itemImg, itemID, itemDetails, itemPriority, itemrestID) in dItems {
                // Create an individual item
                DishDrinkItem.createInManagedObjectContext(moc,
                    name: itemName,  price: itemPrice, link: itemImg, ddID: itemID,  details: itemDetails,  restPriority: itemPriority, restID: itemrestID)
            }
        }
        
    })
    
}
