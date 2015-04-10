//
//  NavigationController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/9/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    let themeColor = UIColor(rgb: 0x4f9cd9)

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        
        // Status bar white font
        self.navigationBar.barTintColor = themeColor
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
//        imageView.contentMode = .ScaleAspectFit
//        let logo = UIImage(named: "noshfolio-medium-white")
//        imageView.image = logo
//        self.navigationItem.titleView = imageView
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
