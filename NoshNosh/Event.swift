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

func durationStringFromTimeString(startTime: String, endTime: String) -> String {
    var duration: String
    var startArray = startTime.componentsSeparatedByString("-")
    var startDay = startArray[2]
    startDay = startDay.substringWithRange(Range<String.Index>(start: advance(startDay.startIndex, 3), end: advance(startDay.startIndex, 5)))
    
    var endArray = endTime.componentsSeparatedByString("-")
    var endDay = endArray[2]
    endDay = endDay.substringWithRange(Range<String.Index>(start: advance(endDay.startIndex, 3), end: advance(endDay.startIndex, 5)))
    
    var start = startDay.toInt()!
    if(start > 12){
        start = start - 12
        startDay = String(start)+"PM"
    } else if(start == 0) {
        startDay = "MIDNIGHT"
    } else{
        if(start == 12){
            startDay = String(start)+"PM"
        } else {
            startDay = String(start)+"AM"
        }
    }

    var end = endDay.toInt()!
    if(end > 12){
        end = end - 12
        endDay = String(end)+"PM"
    } else if(end == 0) {
        endDay = "MIDNIGHT"
    } else{
        if(end == 12){
            endDay = String(end)+"PM"
        } else {
            endDay = String(end)+"AM"
        }
    }
    
    duration = startDay + " - " + endDay
    return duration
}