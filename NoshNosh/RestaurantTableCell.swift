//
//  RestaurantTableCell.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class RestaurantTableCell: UITableViewCell {

    @IBOutlet weak var restaurantBtn: UIButton!
    @IBOutlet weak var restaurantImg: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var cuisineName: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
