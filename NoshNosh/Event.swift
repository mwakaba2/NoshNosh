//
//  Event.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit


struct Event {
    
    var kind: String
    var title: String
    var startTime: String
    var endTime: String
    var postDate: String
    var imageURL: String
    var description: String
    var restaurant: String
    
    init(eventDictionary: NSDictionary){
        kind = "asd"
        title = "asd"
        startTime = "asd"
        endTime = "asd"
        postDate = "asd"
        imageURL  = "asd"
        description = "asd"
        restaurant = "asd"
    }
}


var eventNames: [String] = ["Friday Dinner Specials", "Margarita Madness", "Whiskey Club at the Pig"]

var eventLocations: [String] = ["Black Dog", "El Toro", "Blind Pig Company"]

var eventTimes: [String] = ["5PM - 9PM", "11AM - 10PM", "3pm - Midnight" ]
//e 1
let e1URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/79-black-dog-smoke-and-ale-house/black-dog-smoke-and-ale-house-overview-1.jpg")
let e1DATA = NSData(contentsOfURL : e1URL!)

//e 2
let e2URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/47-el-toro/dishes/150-margaritas.jpg")
let e2DATA = NSData(contentsOfURL :e2URL!)

//e 3
let e3URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/82-the-blind-pig-company/the-blind-pig-company-overview-4.jpg")
let e3DATA = NSData(contentsOfURL : e3URL!)


var eventImages: [UIImage] = [
    UIImage(data : e1DATA!)!,
    UIImage(data : e2DATA!)!,
    UIImage(data : e3DATA!)!
]