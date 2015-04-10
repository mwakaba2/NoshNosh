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
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:DrinkDishTableCell = self.tableView.dequeueReusableCellWithIdentifier("ddcell") as DrinkDishTableCell
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
