//
//  CheckoutTVCell.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 27.04.2023.
//

import UIKit

class CheckoutTVCell: UITableViewCell {

    @IBOutlet weak var BrandLabel: UILabel!
    @IBOutlet weak var TypeProductLabel: UILabel!
    @IBOutlet weak var CostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
