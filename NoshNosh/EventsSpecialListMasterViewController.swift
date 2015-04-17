//
//  EventsSpecialListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
//import PKHUD 

class EventsSpecialListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var i = 0
    var titles = [String]()
    var kinds = [String]()
    var descriptions = [String]()
    var restaurants = [String]()
    var imageURLs = [String]()
    var defaultImages = [UIImage]()
    var hours = [String]()
    var dates = [String]()
    
    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        var dnib = UINib(nibName: "eventsTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ecell")
        tableView.separatorColor = UIColor.grayColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
       
//        var contentView = HUDContentView.ProgressView()
//        HUDController.sharedController.contentView = contentView
//        HUDController.sharedController.show()
        
        DataManager.getDataFromNoshfolioWithSuccess { (NoshData) -> Void in
            
            let json = JSON(data: NoshData)
            let array = json.arrayValue
            
            for Dict in array{
                var title : String = array[self.i]["title"].stringValue
                var kind : String = array[self.i]["kind"].stringValue
                var description : String = array[self.i]["description"].stringValue
                var restaurant : String = array[self.i]["eventable"]["name"].stringValue
                if(array[self.i]["eventable"]["events_image"]["url"] == "/images/fallback/default.png"){
                    var imageURL : String = array[self.i]["eventable"]["images"][0]["url"].stringValue
                    var image = convertImgURLToImg(imageURL)
                    self.defaultImages.append(image)
                    self.imageURLs.append(imageURL)
                } else  {
                    var imageURL : String = array[self.i]["eventable"]["events_image"]["url"].stringValue
                    var image = convertImgURLToImg(imageURL)
                    self.defaultImages.append(image)
                    self.imageURLs.append(imageURL)
                }
                var startTime : String = array[self.i]["start_time"].stringValue
                var endTime: String = array[self.i]["end_time"].stringValue
                var date: String = array[self.i]["post_time"].stringValue
                
                self.titles.append(title)
                self.kinds.append(kind)
                self.descriptions.append(description)
                self.restaurants.append(restaurant)
                var duration = durationStringFromTimeString(startTime, endTime)
                self.hours.append(duration)
                
                var readableDate = convertToReadableDate(date)
                self.dates.append(readableDate)
                
                self.i++
            
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
//                HUDController.sharedController.hide(animated: true)
                self.tableView.reloadData()
            })
           
        }
    
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:EventsTableCell = self.tableView.dequeueReusableCellWithIdentifier("ecell") as! EventsTableCell
        cell.eventName.text = titles[indexPath.row]
        cell.locationLabel.text = restaurants[indexPath.row]
        cell.kindLabel.text = kinds[indexPath.row]
        if(kinds[indexPath.row]=="special"){
            cell.kindLabel.backgroundColor = red
        }else{
            cell.kindLabel.backgroundColor = green
        }
        
        cell.dateLabel.text = dates[indexPath.row]
        cell.timeLabel.text = hours[indexPath.row]
        cell.eventImg.image = defaultImages[indexPath.row]
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
            
            eventSpecialViewController.name = self.titles[indexPath!.row] // get data by index and pass it to second view controller
            eventSpecialViewController.image = self.defaultImages[indexPath!.row]
            eventSpecialViewController.date = self.dates[indexPath!.row]
            eventSpecialViewController.location = self.restaurants[indexPath!.row]
            eventSpecialViewController.duration = self.hours[indexPath!.row]
            eventSpecialViewController.details = self.descriptions[indexPath!.row]
            eventSpecialViewController.kind = self.kinds[indexPath!.row]
            
            
        }
    }

}
