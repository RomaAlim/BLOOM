//
//  ClientTVCell.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

class ClientTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var FullNameCell: UILabel!
    @IBOutlet weak var idCell: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
