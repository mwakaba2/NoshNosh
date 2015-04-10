//
//  Restaurant.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/8/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation

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