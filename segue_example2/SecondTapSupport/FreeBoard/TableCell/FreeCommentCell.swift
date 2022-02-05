//
//  FreeCommentCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/05.
//

import UIKit

protocol YourCellDelegate4 : AnyObject {
    func didPressButton(_ tag: Int)
}

class FreeCommentCell: UITableViewCell {
    
    var cellDelegate : YourCellDelegate4?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
