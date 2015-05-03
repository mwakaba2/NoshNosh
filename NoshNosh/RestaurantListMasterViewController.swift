//
//  RestaurantListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/4/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//


import UIKit
import CoreData

class RestaurantListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    

    @IBOutlet weak var tableView: UITableView!
    var restaurantItems = [RestaurantItem]()
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Register custom cell
        fetchLog()
        var rnib = UINib(nibName: "restaurantTableCell", bundle:nil)
        tableView.registerNib(rnib, forCellReuseIdentifier: "rcell")
    }
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "RestaurantItem")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "priority", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [RestaurantItem] {
            restaurantItems = fetchResults
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantItems.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showRestaurantDetails", sender: tableView)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:RestaurantTableCell = self.tableView.dequeueReusableCellWithIdentifier("rcell") as! RestaurantTableCell
        let restaurantItem = restaurantItems[indexPath.row]
        
        cell.restaurantName.text = restaurantItem.name
        cell.cuisineName.text = restaurantItem.cuisine
        cell.locationName.text = restaurantItem.location
        let img : UIImage = convertImgURLToImg(restaurantItem.defaultImg)
        cell.restaurantImg.image = img
        if(restaurantItem.open == "true"){
            cell.openNow.text = "Open"
            cell.openNow.textColor = green
        }else{
            cell.openNow.text = "Closed"
            cell.openNow.textColor = red
        }
        cell.selectionStyle = .None
        return cell
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 275
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetails"{
            var restaurantViewController : RestaurantViewController = segue.destinationViewController as! RestaurantViewController
            
            var indexPath = self.tableView.indexPathForSelectedRow() //get index of data for selected row
            restaurantViewController.item = restaurantItems[indexPath!.row]
        }
    }
}
