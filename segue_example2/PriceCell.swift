//
//  PriceCell.swift
//  segue_example2
//
//  Created by mars on 2021/12/07.
//

import UIKit

class PriceCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblChange: UILabel!
    @IBOutlet weak var lblpremium: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
