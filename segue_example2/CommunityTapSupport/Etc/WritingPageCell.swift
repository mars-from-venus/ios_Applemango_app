//
//  WritingPageCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/12.
//

import UIKit
import DropDown

class WritingPageCell: UITableViewCell {
    
    @IBOutlet weak var drBtn : UIButton!
    
//    private let arrowImage : UIImageView = {
//        let image = UIImageView()
//        let frame:CGRect = CGRect(x: 0, y: 0, width: 5, height: 20)
//        image.frame = frame
//        image.image = UIImage(named: "arrowIcon")
//
//        return image
//    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        drBtn.setTitle("거래소 선택", for: .normal)
        drBtn.titleLabel?.font = UIFont.systemFont(ofSize:15, weight: .bold)
        drBtn.translatesAutoresizingMaskIntoConstraints = false
        drBtn.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        drBtn.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        drBtn.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        drBtn.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func makeDropDown(){
        let dropDown = DropDown()
        dropDown.dataSource = ["인기게시물","자유게시판","유머게시판","질문/답변","차트분석"]
        dropDown.show()
        dropDown.anchorView = drBtn
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.textFont = UIFont.systemFont(ofSize: 15)
        dropDown.backgroundColor = .white
        dropDown.selectedTextColor = .white
        dropDown.selectionBackgroundColor = UIColor.appColor(.mainColor)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            guard let _ = self else { return }
            drBtn.setTitle(item, for: .normal)
//            print("인덱스 : \(index)")
            //test apply
        }
    }
    
    @IBAction func dropDownBtn(_ sender: UIButton){
        makeDropDown()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
