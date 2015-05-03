//
//  SurpriseMeDetailsViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/29/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit
import CoreData

class SurpriseMeDetailsViewController: UIViewController {

    let green = UIColor(rgb: 0x87D792)
    let red = UIColor(rgb: 0xFFA085)
    
    var item : AnyObject?
    var itemType : String?
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detail1Label: UILabel!
    @IBOutlet weak var detail3Label: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var detail2Label: UILabel!
    @IBOutlet weak var detail4Label: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.itemType == "dd"){
            var item : DishDrinkItem = self.item as! DishDrinkItem
            let img : UIImage = convertImgURLToImg(item.link)
            imageLabel.image =  img
            nameLabel.text = item.name
            var price = item.price
            var floatPrice = (price as NSString).floatValue
            var textPrice = NSString(format:"%.2f", floatPrice)
            detail1Label.text = "$ \(textPrice)"
            detailsLabel.text = item.details
            detail2Label.hidden = true
            detail3Label.hidden = true
            detail4Label.hidden = true
        }
        else if(self.itemType == "r"){
            var item : RestaurantItem = self.item as! RestaurantItem
            let img : UIImage = convertImgURLToImg(item.defaultImg)
            imageLabel.image =  img
            nameLabel.text = item.name
            detail1Label.text = item.location
            detail2Label.text = item.cuisine
            detailsLabel.text = item.details
            detail3Label.hidden = true
            detail4Label.hidden = true
        }
        else{
            var item : EventSpecItem = self.item as! EventSpecItem
            nameLabel.text = item.title
            detail1Label.text = item.location
            detail2Label.text = item.date
            detail3Label.text = item.kind
            if(item.kind == "special"){
                
                detail3Label.backgroundColor = red
            }else{
                detail3Label.backgroundColor = green
            }
            detail4Label.text = item.time
            let img : UIImage = convertImgURLToImg(item.imgURL)
            imageLabel.image = img
            detailsLabel.text = item.details
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}