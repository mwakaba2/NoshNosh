//
//  MoreEventsTableCell.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/22/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import Foundation

import UIKit

class MoreEventsTableCell: UITableViewCell {
    
    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
