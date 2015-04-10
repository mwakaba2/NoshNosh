//
//  RestaurantListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/4/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//


import UIKit

class RestaurantListMasterViewController: UIViewController {
    
    @IBOutlet weak var restaurantBtn: UIButton!

    private let restaurantID = "1.json"
    let pastelGreen = UIColor(rgb: 0xC1F2DC)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/1-destihl/dishes/135-roasted-beet-salad.jpg")
        let imgDATA = NSData(contentsOfURL : imageURL!)
        let restaurantIMG = UIImage(data : imgDATA!)
        restaurantIMG
        
        let baseURL = NSURL(string:
            "https://www.noshfolio.com/restaurants/")
        
        let restaurantsURL = NSURL(string: restaurantID, relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(restaurantsURL!, completionHandler:
            {(location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
                
                if (error == nil) {
                    let dataObject = NSData(contentsOfURL: location)
                    let restaurantDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
                    
                }
                
                
        })
        downloadTask.resume()
        
        restaurantBtn.setBackgroundImage(restaurantIMG, forState: .Normal)
        restaurantBtn.imageView?.contentMode = .Center
        restaurantBtn.layer.borderColor = pastelGreen.CGColor
        restaurantBtn.layer.borderWidth = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
