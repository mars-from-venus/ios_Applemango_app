//
//  MyFirstCell.swift
//  segue_example2
//
//  Created by hs on 2022/02/08.
//

import UIKit

class MyFirstCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imageContainer : UIView!
    @IBOutlet weak var image1 : UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var image2 : UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var image3 : UIImageView!
    @IBOutlet weak var lbl3: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
