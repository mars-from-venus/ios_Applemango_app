//
//  exchageCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/11.
//

import UIKit

class ExchageCell: UITableViewCell {
    @IBOutlet weak var exchangeName : UILabel!
    @IBOutlet weak var exchangeNameSub : UILabel!
    @IBOutlet weak var coinPrice : UILabel!
    @IBOutlet weak var coinChangable : UILabel!
    @IBOutlet weak var coinChagePrice : UILabel!
    @IBOutlet weak var coinPremium : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exchangeNameSub.textColor = UIColor.appColor(.grayTextColor)
        coinChangable.textColor = UIColor.appColor(.mainColor)
        coinChagePrice.textColor = UIColor.appColor(.mainColor)
        coinPremium.textColor = #colorLiteral(red: 0.2886071801, green: 0.6478788257, blue: 0.2914767861, alpha: 1)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
