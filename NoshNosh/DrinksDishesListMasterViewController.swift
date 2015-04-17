//
//  DrinksDishesListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class DrinksDishesListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Register custom cell
        var dnib = UINib(nibName: "drinkDishTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ddcell")
        
//        DataManager.getDataFromNoshfolioWithSuccess { (NoshData) -> Void in
//            
//            let json = JSON(data: NoshData)
//            let array = json.arrayValue
//            
//            for Dict in array{
//                var title : String = array[self.i]["title"].stringValue
//                var kind : String = array[self.i]["kind"].stringValue
//                var description : String = array[self.i]["description"].stringValue
//                var restaurant : String = array[self.i]["eventable"]["name"].stringValue
//                if(array[self.i]["eventable"]["events_image"]["url"] == "/images/fallback/default.png"){
//                    var imageURL : String = array[self.i]["eventable"]["images"][0]["url"].stringValue
//                    var image = convertImgURLToImg(imageURL)
//                    self.defaultImages.append(image)
//                    self.imageURLs.append(imageURL)
//                } else  {
//                    var imageURL : String = array[self.i]["eventable"]["events_image"]["url"].stringValue
//                    var image = convertImgURLToImg(imageURL)
//                    self.defaultImages.append(image)
//                    self.imageURLs.append(imageURL)
//                }
//                var startTime : String = array[self.i]["start_time"].stringValue
//                var endTime: String = array[self.i]["end_time"].stringValue
//                var date: String = array[self.i]["post_time"].stringValue
//                
//                self.titles.append(title)
//                self.kinds.append(kind)
//                self.descriptions.append(description)
//                self.restaurants.append(restaurant)
//                var duration = durationStringFromTimeString(startTime, endTime)
//                self.hours.append(duration)
//                
//                var readableDate = convertToReadableDate(date)
//                self.dates.append(readableDate)
//                
//                self.i++
//                
//            }
//            
//        }

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:DrinkDishTableCell = self.tableView.dequeueReusableCellWithIdentifier("ddcell") as! DrinkDishTableCell
        cell.nameItem.text = itemNames[indexPath.row]
        cell.restaurantName.text = itemRestaurants[indexPath.row]
        cell.imgItem.image = itemImages[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 275
    }
}
