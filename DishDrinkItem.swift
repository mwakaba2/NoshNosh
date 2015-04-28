//
//  DishDrinkItem.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/27/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import CoreData

class DishDrinkItem: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var price: String
    @NSManaged var link: String
    @NSManaged var ddID: String
    @NSManaged var details: String
    @NSManaged var restPriority: String
    @NSManaged var restID: String
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, price: String, link: String, ddID: String, details: String, restPriority: String, restID: String) -> DishDrinkItem {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("DishDrinkItem", inManagedObjectContext: moc) as! DishDrinkItem
        
        newItem.name = name
        newItem.price = price
        newItem.link = link
        newItem.ddID = ddID
        newItem.details = details
        newItem.restPriority = restPriority
        newItem.restID = restID
        
        return newItem
    }
    
}