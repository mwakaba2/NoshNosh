//
//  RestaurantListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/4/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//


import UIKit

class RestaurantListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private let restaurantID = "1.json"

    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL = NSURL(string:
            "https://www.noshfolio.com/restaurants/")
        
        let restaurantsURL = NSURL(string: restaurantID, relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(restaurantsURL!, completionHandler:
            {(location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
                
                if (error == nil) {
                    let dataObject = NSData(contentsOfURL: location)
                    let restaurantDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
                
                    println(restaurantDictionary)
                } else {
                    
                    let networkIssueController = UIAlertController(title: "Error", message: "Unable to load data. Connectivity error!", preferredStyle: .Alert)
                    
                    let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    networkIssueController.addAction(okButton)
                    
                    let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    networkIssueController.addAction(cancelButton)
                    
                    
                    self.presentViewController(networkIssueController, animated: true, completion: nil)

                    
                }
                

                
                
        })
        downloadTask.resume()
        
        //Register custom cell
        var rnib = UINib(nibName: "restaurantTableCell", bundle:nil)
        tableView.registerNib(rnib, forCellReuseIdentifier: "rcell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showRestaurantDetails", sender: tableView)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:RestaurantTableCell = self.tableView.dequeueReusableCellWithIdentifier("rcell") as! RestaurantTableCell
        cell.restaurantName.text = restaurantNames[indexPath.row]
        cell.cuisineName.text = cuisineNames[indexPath.row]
        cell.locationName.text = locationNames[indexPath.row]
        cell.restaurantImg.image = restaurantImages[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 275
    }
}
