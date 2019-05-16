//
//  CoinTableViewCell.swift
//  ParseAPI
//
//  Created by Ivan Drago on 15/05/2019.
//  Copyright © 2019 Ivan Drago. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PraceLabel: UILabel!
    @IBOutlet weak var PercentChangeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
