//
//  DataManager.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/12/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation
import UIKit

//IMPORTANT API CALLS
// list of restaurants: /restaurants/show_n.json (default: 10 restaurants)
// restaurants/show_n.json?count=1
// featured items image /owners_recommendations/id/default_image_url.json
// surprise me /owners_recommendations/show_n.json
// restaurants/id/default_image_url.json 
// restaurants/id/am_i_open.json
// events/id/default_image_url.json



class DataManager: UIViewController {
    
    class func getDataFromNoshfolioWithSuccess(Noshfolio: String, success: ((NoshData: NSData!) -> Void)) {
        
        loadDataFromURL(NSURL(string: Noshfolio)!, completion:{(data, error) -> Void in
            
            if let urlData = data {
                
                success(NoshData: urlData)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.wakawaka.NoshNosh", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                    
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}