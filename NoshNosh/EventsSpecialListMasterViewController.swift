//
//  EventsSpecialListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class EventsSpecialListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Register custom cell
        var dnib = UINib(nibName: "eventsTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ecell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventNames.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:EventsTableCell = self.tableView.dequeueReusableCellWithIdentifier("ecell") as EventsTableCell
        cell.eventName.text = eventNames[indexPath.row]
        cell.locationLabel.text = eventLocations[indexPath.row]
        cell.timeLabel.text = eventTimes[indexPath.row]
        cell.eventImg.image = eventImages[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 275
    }

}
