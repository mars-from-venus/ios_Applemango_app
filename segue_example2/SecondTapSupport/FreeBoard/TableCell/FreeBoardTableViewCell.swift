//
//  freeBoardTableViewCell.swift
//  segue_example2
//
//  Created by mars on 2022/01/02.
//

import UIKit

protocol YourCellDelegate : AnyObject {
    func didPressButton(_ tag: Int)
}

class FreeBoardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var lblContent: UILabel!

    var cellDelegate:YourCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myView.layer.borderWidth = 0.5
        myView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.bounds.inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
       
    }

}
