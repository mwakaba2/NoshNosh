//
//  EventsSpecialListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData
//Todo list cache data

class EventsSpecialListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    
    var eventSpecItems = [EventSpecItem]()
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://noshfolio.com/events.json"
        
        //Register custom cell
        var dnib = UINib(nibName: "eventsTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ecell")
        tableView.separatorColor = UIColor.grayColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
       
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.fetchLog()
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            PKHUD.sharedHUD.hide(animated: false)
            self.tableView.reloadData()
        })

        
    }
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "EventSpecItem")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EventSpecItem] {
            eventSpecItems = fetchResults
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventSpecItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:EventsTableCell = self.tableView.dequeueReusableCellWithIdentifier("ecell") as! EventsTableCell
        let eventSpecItem = eventSpecItems[indexPath.row]

        cell.eventName.text = eventSpecItem.title
        cell.locationLabel.text = eventSpecItem.location
        cell.kindLabel.text = eventSpecItem.kind
        if(eventSpecItem.kind == "special"){
            cell.kindLabel.backgroundColor = red
        }else{
            cell.kindLabel.backgroundColor = green
        }

        cell.dateLabel.text = eventSpecItem.date
        cell.timeLabel.text = eventSpecItem.time
        let img : UIImage = convertImgURLToImg(eventSpecItem.imgURL)
        cell.eventImg.image = img
        cell.selectionStyle = .None
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showEventDetails", sender: tableView)
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showEventDetails"{
            var eventSpecialViewController : EventSpecialViewController = segue.destinationViewController as! EventSpecialViewController
            
            var indexPath = self.tableView.indexPathForSelectedRow() //get index of data for selected row
            let eventSpecItem = eventSpecItems[indexPath!.row]

            eventSpecialViewController.name = eventSpecItem.title // get data by index and pass it to second view controller
            eventSpecialViewController.image = convertImgURLToImg(eventSpecItem.imgURL)
            eventSpecialViewController.date = eventSpecItem.date
            eventSpecialViewController.location = eventSpecItem.location
            eventSpecialViewController.duration = eventSpecItem.time
            eventSpecialViewController.details = eventSpecItem.details
            eventSpecialViewController.kind = eventSpecItem.kind
            eventSpecialViewController.restaurantId = eventSpecItem.restaurantID
        }
        
    }

}
