//
//  EntireDetailCell.swift
//  segue_example2
//
//  Created by mars on 2022/01/26.
//

import UIKit

class EntireDetailCell: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var lblContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
