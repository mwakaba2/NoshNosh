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
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let imageURL = NSURL(string: "https://noshfolio.s3.amazonaws.com/images/restaurants/1-destihl/dishes/135-roasted-beet-salad.jpg")
        let imgDATA = NSData(contentsOfURL : imageURL!)
        let restaurantIMG = UIImage(data : imgDATA!)
        restaurantIMG
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        cell.imageView?.image = restaurantIMG
        cell.imageView?.contentMode = .ScaleAspectFit
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }

}
