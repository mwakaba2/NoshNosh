//
//  Event.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit


var months: Dictionary = ["01": "January", "02": "February", "03": "March", "04": "April", "05": "May", "06": "June", "07": "July", "08": "August", "09": "September",
    "10": "October", "11": "November", "12": "December"]

func convertImgURLToImg(img: String) -> UIImage {
    var image: UIImage
    let URL = NSURL(string: img)
    let Data = NSData(contentsOfURL : URL!)
    image = UIImage(data: Data!)!
    return image
}

func convertToReadableDate(date: String) -> String {
    var readable: String
    var readableArray = date.componentsSeparatedByString("-")
    var year = readableArray[0]
    var month = months[readableArray[1]]!
    var day = readableArray[2]
    day = day.substringWithRange(Range<String.Index>(start: advance(day.startIndex, 0), end: advance(day.startIndex, 2)))
    readable = "\(month) \(day), \(year)"
    return readable
}

//func durationStringFromTimeString(startTime: String, endTime: String) -> String {
//    var duration: String
//    
//
//    return duration
//}