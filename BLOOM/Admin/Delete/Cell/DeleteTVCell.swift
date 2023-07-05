//
//  DeleteTVCell.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

protocol DeleteTVCellDelegate: AnyObject {
    func didTapDeleteButton(cell: DeleteTVCell)
}

class DeleteTVCell: UITableViewCell {
    weak var delegate: DeleteTVCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ButtonDeleteAction(_ sender: UIButton) {
        delegate?.didTapDeleteButton(cell: self)
    }
    @IBOutlet weak var ButtonCell: UIButton!
    @IBOutlet weak var costCell: UILabel!
    @IBOutlet weak var typeProductCell: UILabel!
    @IBOutlet weak var brandCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
}
