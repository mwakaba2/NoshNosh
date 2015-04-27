//
//  EventSpecialViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/15/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData


class EventSpecialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var name: String = ""
    var location: String = ""
    var image: UIImage?
    var details: String = ""
    var duration: String = ""
    var date: String = ""
    var kind: String = ""
    var restaurantId : String = ""
    
    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    
    var eventSpecItems = [EventSpecItem]()
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    @IBOutlet weak var smallTableView: UITableView!
    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.name
        self.locationLabel.text = self.location
        self.defaultImage.image = self.image
        self.dateLabel.text = self.date
        self.durationLabel.text = self.duration
        self.descriptionLabel.text = self.details
        self.kindLabel.text = self.kind
        
        fetchLog()
        var cNib = UINib(nibName: "moreEventsTableCell", bundle:nil)
        smallTableView.registerNib(cNib, forCellReuseIdentifier: "mecell")
        smallTableView.separatorColor = UIColor.grayColor()
        
        // Do any additional setup after loading the view.
    }
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "EventSpecItem")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        //println(restaurantID)
        // Create a new predicate that filters out any object that
        // doesn't have a title of "Best Language" exactly.
        let predicate = NSPredicate(format: "restaurantID == %@", self.restaurantId)
        
        // Set the predicate on the fetch request
        fetchRequest.predicate = predicate
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EventSpecItem] {
            eventSpecItems = fetchResults
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "moreEventsTable" {
//            var moreEventsTableController : MoreEventsTableViewController = segue.destinationViewController as! MoreEventsTableViewController
//            moreEventsTableController.restaurantID = self.restaurantId
//            
//            
//        }
//    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventSpecItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:MoreEventsTableCell = self.smallTableView.dequeueReusableCellWithIdentifier("mecell") as! MoreEventsTableCell
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
        var img : UIImage = convertImgURLToImg(eventSpecItem.imgURL)
        cell.eventImg.image = img
        cell.selectionStyle = .None
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
}
