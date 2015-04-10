//
//  Restaurant.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/8/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit
struct Restaurant {
    
    var name: String
    var area: String
    //var closed: Bool
    var cuisine: String
    

    init(restaurantDictionary:NSDictionary) {
        let addressesArray: NSArray = restaurantDictionary["addresses"] as NSArray
        let addressesDictionary: NSDictionary = addressesArray[0] as NSDictionary
        
        name = restaurantDictionary["name"] as String
        area = addressesDictionary["city"] as String
        //closed = restaurantDictionary["closed"] as Bool
        cuisine = restaurantDictionary["cuisine"] as String

    }

}

var restaurantNames: [String] = ["The Cracked Truck", "Sakanaya Restaurant", "Caffe Bene"]

var locationNames: [String] = ["Campus", "Campus", "Urbana"]

var cuisineNames: [String] = ["American", "Japanese", "Cafe"]


//rest 1
let rest1URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/128-the-cracked-truck/the-cracked-truck-overview-1.jpg")
let rest1DATA = NSData(contentsOfURL : rest1URL!)

//rest 2
let rest2URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/163-sakanaya-restaurant/sakanaya-restaurant-overview-4.jpg")
let rest2DATA = NSData(contentsOfURL : rest2URL!)

//rest 3
let rest3URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/174-caffe-bene/caffe-bene-overview-9.jpg")
let rest3DATA = NSData(contentsOfURL : rest3URL!)


var restaurantImages: [UIImage] = [
    UIImage(data : rest1DATA!)!,
    UIImage(data : rest2DATA!)!,
    UIImage(data : rest3DATA!)!
]


