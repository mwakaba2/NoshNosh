//
//  EventsSpecialListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit


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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        var dnib = UINib(nibName: "eventsTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ecell")
        
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
        cell.dateLabel.text = dates[indexPath.row]
        cell.timeLabel.text = hours[indexPath.row]
        cell.eventImg.image = defaultImages[indexPath.row]
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 275
    }

}
