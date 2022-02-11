//
//  QABoardCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/12.
//

import UIKit

class QABoardCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var lblView : UIView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblFamous : UILabel!
    @IBOutlet weak var lblFree : UILabel!
    @IBOutlet weak var lblNick: UILabel!
    @IBOutlet weak var lblTime : UILabel!
    @IBOutlet weak var lblShare : UILabel!
    @IBOutlet weak var lblComment : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myView.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 1)
        lblCustom()
        lblTextCustom()
        lblAutoLayout()
    }
    
    func lblAutoLayout(){
        myView.translatesAutoresizingMaskIntoConstraints = false
        lblContent.translatesAutoresizingMaskIntoConstraints = false
        lblTime.translatesAutoresizingMaskIntoConstraints = false
        myView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        myView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        myView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        lblContent.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 15).isActive = true
        lblContent.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 15).isActive = true
    }
    
    func lblCustom(){
        lblFamous.layer.borderWidth = 1
        lblFamous.layer.borderColor = UIColor.appColor(.mainColor).cgColor
        lblFamous.layer.cornerRadius = 5
        lblFamous.layer.backgroundColor = UIColor.appColor(.mainColor).cgColor
        lblFamous.textColor = .white
        lblFree.layer.borderWidth = 1
        lblFree.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lblFree.layer.cornerRadius = 5
        lblNick.textColor = UIColor.appColor(.grayTextColor)
        lblTime.textColor = UIColor.appColor(.grayTextColor)
        lblFree.sizeToFit()
    }
    
    func lblTextCustom(){
        lblContent.numberOfLines = 0
        lblContent.lineBreakMode = .byWordWrapping
        lblTitle.numberOfLines = 1
        lblTitle.lineBreakMode = .byTruncatingTail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
