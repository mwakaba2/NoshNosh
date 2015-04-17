//
//  EventSpecialViewController.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/15/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit


class EventSpecialViewController: UIViewController {

    var name: String = ""
    var location: String = ""
    var image: UIImage?
    var details: String = ""
    var duration: String = ""
    var date: String = ""
    var kind: String = ""
    
    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.name
        self.locationLabel.text = self.location
        self.defaultImage.image = self.image
        self.dateLabel.text = self.date
        self.durationLabel.text = self.duration
        self.descriptionLabel.text = self.details
        self.kindLabel.text = self.kind
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
