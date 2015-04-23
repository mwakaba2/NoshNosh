//
//  MoreEventsTableViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/22/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

class MoreEventsTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var restaurantID : String = ""
//    let green = UIColor(rgb: 0x87D792)
//    let red = UIColor(rgb: 0xFFA085)
//    
//    var eventSpecItems = [EventSpecItem]()
//    // Retreive the managedObjectContext from AppDelegate
//    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//    
//
//    //@IBOutlet var smallTableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //Register custom cell
//        fetchLog()
//        var cNib = UINib(nibName: "moreEventsTableCell", bundle:nil)
//        smallTableView.registerNib(cNib, forCellReuseIdentifier: "mecell")
//        smallTableView.separatorColor = UIColor.grayColor()
//        
//    }
//
//    func fetchLog() {
//        let fetchRequest = NSFetchRequest(entityName: "EventSpecItem")
//        
//        // Create a sort descriptor object that sorts on the "title"
//        // property of the Core Data object
//        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
//        
//        // Set the list of sort descriptors in the fetch request,
//        // so it includes the sort descriptor
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        //println(restaurantID)
//        // Create a new predicate that filters out any object that
//        // doesn't have a title of "Best Language" exactly.
//        let predicate = NSPredicate(format: "restaurantID == %@", self.restaurantID)
//        
//        // Set the predicate on the fetch request
//        fetchRequest.predicate = predicate
//        
//        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EventSpecItem] {
//            eventSpecItems = fetchResults
//        }
//    }
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func smallTableView(smallTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return eventSpecItems.count;
//    }
//    
//    func smallTableView(smallTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell:MoreEventsTableCell = self.smallTableView.dequeueReusableCellWithIdentifier("mecell") as! MoreEventsTableCell
//        let eventSpecItem = eventSpecItems[indexPath.row]
//        
//        cell.eventName.text = eventSpecItem.title
//        cell.locationLabel.text = eventSpecItem.location
//        cell.kindLabel.text = eventSpecItem.kind
//        if(eventSpecItem.kind == "special"){
//            cell.kindLabel.backgroundColor = red
//        }else{
//            cell.kindLabel.backgroundColor = green
//        }
//        
//        cell.dateLabel.text = eventSpecItem.date
//        cell.timeLabel.text = eventSpecItem.time
//        let img : UIImage = convertImgURLToImg(eventSpecItem.imgURL)
//        cell.eventImg.image = img
//        cell.selectionStyle = .None
//        return cell
//        
//    }
//    
//    
//    func smallTableView(smallTableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        println("You selected cell #\(indexPath.row)!")
//    }
//    
//    func smallTableView(smallTableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 300
//    }
//
}
