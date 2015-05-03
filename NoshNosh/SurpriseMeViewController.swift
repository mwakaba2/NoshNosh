//
//  SurpriseMeViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/5/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

class SurpriseMeViewController: UIViewController {
    

    
    var eventSpecItems = [EventSpecItem]()
    var dishDrinkItems = [DishDrinkItem]()
    var restaurantItems = [RestaurantItem]()

    
    @IBOutlet weak var rBtn: UIButton!
    @IBOutlet weak var esBtn: UIButton!
    @IBOutlet weak var ddBtn: UIButton!
    
    @IBAction func ddClicked(sender: AnyObject) {
        if(ddBtn.selected == false){
            ddBtn.selected = true
            rBtn.selected = false
            esBtn.selected = false
        }
        else{
            ddBtn.selected = false
        }
        
    }
    
    @IBAction func rClicked(sender: AnyObject) {
        
        if(rBtn.selected == false){
            rBtn.selected = true
            esBtn.selected = false
            ddBtn.selected = false
        }
        else{
            rBtn.selected = false
        }
        
    }
    
    @IBAction func esClicked(sender: AnyObject) {
        
        if(esBtn.selected == false){
            esBtn.selected = true
            ddBtn.selected = false
            rBtn.selected = false
        }
        else{
            esBtn.selected = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              // Do any additional setup after loading the view.
        fetchDish()
        fetchEvents()
        fetchRest()
        
        
        
    }

    
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "surprise"{
            var surpriseDetailsController : SurpriseMeDetailsViewController = segue.destinationViewController as! SurpriseMeDetailsViewController
            var item : AnyObject?
            var itemType : String?
            if(ddBtn.selected == true){
                var rand = Int(arc4random_uniform(UInt32(dishDrinkItems.count-1)))
                item = dishDrinkItems[rand]
                itemType = "dd"
            }else if(rBtn.selected == true){
                var rand = Int(arc4random_uniform(UInt32(restaurantItems.count-1)))
                item = restaurantItems[rand]
                itemType = "r"
            }else{
                var rand = Int(arc4random_uniform(UInt32(eventSpecItems.count-1)))
                item = eventSpecItems[rand]
                itemType = "es"
            }
            surpriseDetailsController.item = item
            surpriseDetailsController.itemType = itemType
        }
    }
    
    func fetchDish() {
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
    
    func fetchRest() {
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

    func fetchEvents() {
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
}
