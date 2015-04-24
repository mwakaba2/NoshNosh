//
//  RestaurantItem.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/18/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import CoreData



class RestaurantItem: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var location: String
    @NSManaged var defaultImg: String
    @NSManaged var cuisine: String
    @NSManaged var details: String
    @NSManaged var priority: String
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, location: String, defaultImg: String, cuisine: String, details: String, priority: String) -> RestaurantItem {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("RestaurantItem", inManagedObjectContext: moc) as! RestaurantItem
        newItem.name = name
        newItem.location = location
        newItem.defaultImg = defaultImg
        newItem.cuisine = cuisine
        newItem.details = details
        newItem.priority = priority
        
        return newItem
    }
    
}