//
//  DrinkDishTableCellTableViewCell.swift
//  NoshNosh
//
//  Created by Mariko Wakabayashi on 4/10/15.
//  Copyright (c) 2015 wakawaka. All rights reserved.
//

import UIKit

class DrinkDishTableCell: UITableViewCell {


    @IBOutlet weak var imgItem: UIImageView!

    @IBOutlet weak var nameItem: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
