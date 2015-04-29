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
    
    var dishItems = [DishDrinkItem]()
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBAction func surpriseMe(sender: AnyObject) {
        if(imageLabel.hidden == true){
            imageLabel.hidden = false
            detailsLabel.hidden = false
            priceLabel.hidden = false
        }
        var rand = Int(arc4random_uniform(UInt32(dishItems.count)))
        let dishItem = dishItems[rand]
        let img : UIImage = convertImgURLToImg(dishItem.link)
        imageLabel.image =  img
        nameLabel.text = dishItem.name
        var price = dishItem.price
        var floatPrice = (price as NSString).floatValue
        var textPrice = NSString(format:"%.2f", floatPrice)
        priceLabel.text = "$ \(textPrice)"
        detailsLabel.text = dishItem.details
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLabel.hidden = true
        nameLabel.text = "A Dish for you!"
        detailsLabel.hidden = true
        priceLabel.hidden = true
        fetchLog()
        // Do any additional setup after loading the view.
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
            dishItems = fetchResults
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
