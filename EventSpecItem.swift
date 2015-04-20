//
//  EventSpecItem.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/19/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import CoreData



class EventSpecItem: NSManagedObject {
    
    @NSManaged var title: String
    @NSManaged var time: String
    @NSManaged var location: String
    @NSManaged var kind: String
    @NSManaged var imgURL: String
    @NSManaged var details: String
    @NSManaged var date: String
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, title: String, time: String, location: String, kind: String, imgURL: String, details: String, date: String) -> EventSpecItem {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("EventSpecItem", inManagedObjectContext: moc) as! EventSpecItem
        newItem.title = title
        newItem.time = time
        newItem.location = location
        newItem.kind = kind
        newItem.imgURL =  imgURL
        newItem.details = details
        newItem.date = date
        
        return newItem
    }
    
}
