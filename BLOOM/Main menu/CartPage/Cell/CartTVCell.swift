//
//  CartTVCell.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//

import UIKit

class CartTVCell: UITableViewCell {

    @IBOutlet weak var ProductBrandCart: UILabel!
    
    @IBOutlet weak var ProductTypeCart: UILabel!
    
    @IBOutlet weak var ProductCostCart: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var ProductImageCart: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
