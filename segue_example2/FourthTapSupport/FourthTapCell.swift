//
//  FourthTapCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/09.
//

import UIKit

protocol YourCellDelegate7:AnyObject {
    func didPress(_ tag:Int)
}

class FourthTapCell: UITableViewCell {

    @IBOutlet weak var profileIcon:UIImageView!
    @IBOutlet weak var lblNick: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    var cellDelegate:YourCellDelegate7?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTime.textColor = UIColor.appColor(.grayTextColor)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
