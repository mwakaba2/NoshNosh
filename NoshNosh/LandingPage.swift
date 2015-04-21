//
//  LandingPage.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/19/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit

//item 1
let url1 = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/163-sakanaya-restaurant/dishes/561-sakanaya-supreme.jpg")
let data1 = NSData(contentsOfURL : url1!)

//item 2
let url2 = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/72-radio-maria/radio-maria-overview-6.jpg")
let data2 = NSData(contentsOfURL : url2!)

//item 3
let url3 = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/44-big-grove-tavern/big-grove-tavern-overview-9.jpg")
let data3 = NSData(contentsOfURL : url3!)


//item 4
let url4 = NSURL(string: "https://s3.amazonaws.com/noshfolio/images/restaurants/173-layalina-mediterranean/layalina-mediterranean-overview-9.jpg")
let data4 = NSData(contentsOfURL : url4!)

var images: [UIImage] = [
    UIImage(data : data1!)!,
    UIImage(data : data2!)!,
    UIImage(data : data3!)!,
    UIImage(data : data4!)!
]


