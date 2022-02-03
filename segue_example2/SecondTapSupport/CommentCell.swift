//
//  CommentCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/03.
//

import UIKit

protocol YourCellDelegate3 : AnyObject {
    func didPressButton(_ tag: Int)
}

class CommentCell: UITableViewCell {
    var cellDelegate:YourCellDelegate3?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
