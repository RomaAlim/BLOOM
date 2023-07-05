//
//  HomeTVCell.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 15.04.2023.
//

import UIKit

class HomeTVCell: UITableViewCell {

    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductBrand: UILabel!
    @IBOutlet weak var ProductType: UILabel!
    @IBOutlet weak var ProductCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
