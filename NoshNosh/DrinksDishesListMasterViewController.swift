//
//  DrinksDishesListMasterViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

class DrinksDishesListMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dishDrinkItems = [DishDrinkItem]()
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLog()
        //Register custom cell
        var dnib = UINib(nibName: "drinkDishTableCell", bundle:nil)
        tableView.registerNib(dnib, forCellReuseIdentifier: "ddcell")

    }
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "DishDrinkItem")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "restPriority", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [DishDrinkItem] {
            dishDrinkItems = fetchResults
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishDrinkItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:DrinkDishTableCell = self.tableView.dequeueReusableCellWithIdentifier("ddcell") as! DrinkDishTableCell
        let dishItem = dishDrinkItems[indexPath.row]
        
        cell.nameItem.text = dishItem.name
        let img : UIImage = convertImgURLToImg(dishItem.link)
        cell.imgItem.image = img
        cell.selectionStyle = .None
        cell.detailsLabel.text = dishItem.details
        var price = dishItem.price
        var floatPrice = (price as NSString).floatValue
        var textPrice = NSString(format:"%.2f", floatPrice)
        cell.priceLabel.text = "$ \(textPrice)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 320
    }
}
