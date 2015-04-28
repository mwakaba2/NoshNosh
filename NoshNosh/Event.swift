//
//  Event.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/27/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit
import CoreData


let eventsURL = "http://noshfolio.com/events.json"
var j = 0
var eItems = [(String, String, String, String,String, String, String, String)]()



func loadEvents(){
    DataManager.getDataFromNoshfolioWithSuccess(eventsURL, success: {(NoshData)  -> Void in
        
        let json = JSON(data: NoshData)
        let array = json.arrayValue
        
        for Dict in array{
            var title : String = array[j]["title"].stringValue
            var kind : String = array[j]["kind"].stringValue
            var description : String = array[j]["description"].stringValue
            var restaurant : String = array[j]["eventable"]["name"].stringValue
            var startTime : String = array[j]["start_time"].stringValue
            var endTime: String = array[j]["end_time"].stringValue
            var date: String = array[j]["post_time"].stringValue
            var duration = durationStringFromTimeString(startTime, endTime)
            var readableDate = convertToReadableDate(date)
            var id : String = array[j]["id"].stringValue
            var url : String = "http://noshfolio.com/events/\(id)/default_image_url.json"
            var eventImage: String = NSString(data: DataManager.getJSONObject(url), encoding: NSUTF8StringEncoding)! as String
            
            j++
            eItems.append(( title, duration, restaurant, kind, eventImage, description, readableDate, id))
            
        }
        if let moc = managedObjectContext {
            
            // Loop through, creating items
            for (itemTitle ,itemTime, itemLocation, itemKind, itemImageURL, itemDetails, itemDate, itemID) in eItems {
                // Create an individual item
                EventSpecItem.createInManagedObjectContext(moc,
                    title: itemTitle, time: itemTime, location: itemLocation,  kind: itemKind, imgURL: itemImageURL, details: itemDetails, date: itemDate, restaurantID: itemID)
            }
        }
        PKHUD.sharedHUD.hide(animated: false)
    })
}