//
//  DropCell.swift
//  segue_example2
//
//  Created by mars on 2022/01/17.
//

import UIKit
import DropDown

class DropCell: DropDownCell {

    
    @IBOutlet weak var logoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
