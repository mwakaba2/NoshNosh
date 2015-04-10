//
//  ViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/4/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var restaurantsButton: UIButton!
    @IBOutlet weak var drinksDishesButton: UIButton!
    @IBOutlet weak var eventsSpecialsButton: UIButton!
    @IBOutlet weak var surpriseMeButton: UIButton!
    
    let themeColor = UIColor(rgb: 0x4f9cd9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantsButton.setTitle("Restaurants", forState: .Normal)
        drinksDishesButton.setTitle("Drinks and Dishes", forState: .Normal)
        eventsSpecialsButton.setTitle("Events and Specials", forState: .Normal)
        surpriseMeButton.setTitle("Surprise Me!", forState: .Normal)
        
        restaurantsButton.layer.borderColor = themeColor.CGColor
        restaurantsButton.layer.borderWidth = 1
        drinksDishesButton.layer.borderWidth = 1
        drinksDishesButton.layer.borderColor = themeColor.CGColor
        eventsSpecialsButton.layer.borderWidth = 1
        eventsSpecialsButton.layer.borderColor = themeColor.CGColor
        surpriseMeButton.layer.borderWidth = 1
        surpriseMeButton.layer.borderColor = themeColor.CGColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

