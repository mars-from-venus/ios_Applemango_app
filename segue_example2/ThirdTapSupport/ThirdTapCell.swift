//
//  ThirdTapCell.swift
//  segue_example2
//
//  Created by hs on 2022/02/09.
//

import UIKit

protocol yourCellDelegate8:AnyObject {
    func pressButton(tag:Int)
}

class ThirdTapCell: UITableViewCell {
    
    @IBOutlet weak var lblNotice:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblComment:UILabel!
    @IBOutlet weak var lblReviews:UILabel!
    @IBOutlet weak var lblTime:UILabel!
    
    var cellDelegate : yourCellDelegate8?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblCustom()
    }
    
    func lblCustom(){
        lblNotice.layer.borderWidth = 1
        lblNotice.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lblNotice.layer.cornerRadius = 5
        lblNotice.textColor = UIColor.appColor(.grayTextColor)
        lblNotice.textColor = UIColor.appColor(.grayTextColor)
        lblNotice.sizeToFit()
        lblComment.textColor = UIColor.appColor(.grayTextColor)
        lblTime.textColor = UIColor.appColor(.grayTextColor)
        lblReviews.textColor = UIColor.appColor(.grayTextColor)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
