//
//  DrinksDishes.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit

var itemNames: [String] = ["Strawberry Crepe", "Margarita Flights", "Banana & Walnut Honey"]

var itemRestaurants: [String] = ["El Oasis", "Wedge Tequila Bar & Grill", "Caffe Bene"]

//item 1
let item1URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/132-el-oasis/dishes/530-strawberry-crepe.jpg")
let item1DATA = NSData(contentsOfURL : item1URL!)

//item 2
let item2URL = NSURL(string:"https://noshfolio.s3.amazonaws.com/images/restaurants/96-wedge-tequila-bar-grill/dishes/717-margarita-flights.jpg")
let item2DATA = NSData(contentsOfURL : item2URL!)

//item 3
let item3URL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/174-caffe-bene/dishes/622-banana-walnut-honey-bread.jpg")
let item3DATA = NSData(contentsOfURL : item3URL!)


var itemImages: [UIImage] = [
    UIImage(data : item1DATA!)!,
    UIImage(data : item2DATA!)!,
    UIImage(data : item3DATA!)!
]