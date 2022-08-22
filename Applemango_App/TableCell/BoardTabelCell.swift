//
//  BoardTabelCell.swift
//  segue_example2
//
//  Created by mars on 2022/04/03.
//

import UIKit
import SnapKit

class BoardTableCell: UITableViewCell {
    
    static let identifier = "boardCell"
    
    lazy var container : UIView = {
        let view = UIView()
        
        return view
    }()
    lazy var lblBox : UIView = {
        let view = UIView()
        
        return view
    }()
    lazy var lblBoard : UILabel = {
        let lbl = PaddingLabel()
        lbl.text = "자유"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lbl.layer.borderWidth = 1
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.layer.cornerRadius = 5
        
        return lbl
    }()
    lazy var lblHot : UILabel = {
        let lbl = PaddingLabel()
        lbl.text = "인기"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor.appColor(.mainColor)
        lbl.layer.cornerRadius = 5
        lbl.clipsToBounds = true
        
        return lbl
    }()
    lazy var contentBox : UIView = {
        let view = UIView()
        
        return view
    }()
    lazy var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.font = UIFont.systemFont(ofSize: 13)
        
        return lbl
    }()
    lazy var lblContent : UILabel = {
        let lbl = UILabel()
        lbl.text = "내용"
        lbl.font = UIFont.systemFont(ofSize: 13)
        
        return lbl
    }()
    lazy var subBox : UIView = {
        let view = UIView()
        
        return view
    }()
    lazy var lblNick : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        
        return lbl
    }()
    lazy var lblTime : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        lbl.text = "10분 전"

        return lbl
    }()
    lazy var bottomBox : UIView = {
        let view = UIView()
        
        return view
    }()
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.setTitle("공감하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(UIColor.appColor(.shareGrayColor), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "smileIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.imageEdgeInsets = .init(top: 0, left:0, bottom: 0, right: 6)
        
        return button
    }()
    lazy var commentButton : UIButton = {
        let button = UIButton()
        button.setTitle("댓글", for: .normal)
        button.setTitleColor(UIColor.appColor(.shareGrayColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "talkIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.imageEdgeInsets = .init(top: 0, left:0, bottom: 0, right: 6)
        
        return button
    }()
    lazy var divider : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.backGray)
        view.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    lazy var divider2 : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func addSubview(){
        self.contentView.addSubview(container)
        container.addSubview(lblBox)
        container.addSubview(contentBox)
        container.addSubview(subBox)
        container.addSubview(bottomBox)
        container.addSubview(divider)
        container.addSubview(divider2)
        lblBox.addSubview(lblBoard)
        lblBox.addSubview(lblHot)
        contentBox.addSubview(lblTitle)
        contentBox.addSubview(lblContent)
        subBox.addSubview(lblNick)
        subBox.addSubview(lblTime)
        bottomBox.addSubview(shareButton)
        bottomBox.addSubview(commentButton)
    }
    
   private func setConstraints(){
        container.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        lblBox.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(container)
            make.height.equalTo(45)
        }
        lblBoard.snp.makeConstraints { make in
            make.top.equalTo(lblBox).offset(15)
            make.bottom.equalTo(lblBox).offset(-10)
            make.leading.equalTo(lblBox).offset(15)
        }
        lblHot.snp.makeConstraints { make in
            make.leading.equalTo(lblBoard.snp.trailing).offset(5)
            make.top.equalTo(lblBox).offset(15)
            make.bottom.equalTo(lblBox).offset(-10)
            if(lblNick.isEnabled){
                make.leading.equalTo(lblBox).offset(15)
                make.top.equalTo(lblBox).offset(15)
                make.bottom.equalTo(lblBox).offset(-10)
            }
        }
        contentBox.snp.makeConstraints { make in
            make.top.equalTo(lblBox.snp.bottom)
            make.leading.trailing.equalTo(container)
        }
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(contentBox)
            make.leading.equalTo(contentBox).offset(15)
            make.trailing.equalTo(contentBox).offset(-15)
            make.height.equalTo(20)
        }
        lblContent.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(3)
            make.trailing.equalTo(contentBox.snp.trailing).offset(-15)
            make.leading.equalTo(contentBox.snp.leading).offset(15)
            make.bottom.equalTo(contentBox).offset(-5)
        }
        subBox.snp.makeConstraints { make in
            make.top.equalTo(contentBox.snp.bottom)
            make.leading.trailing.equalTo(container)
        }
        lblNick.snp.makeConstraints { make in
            make.top.equalTo(subBox).offset(10)
            make.leading.equalTo(subBox).offset(15)
            make.bottom.equalTo(subBox).offset(-10)
        }
        lblTime.snp.makeConstraints { make in
            make.top.equalTo(subBox).offset(10)
            make.bottom.equalTo(subBox).offset(-10)
            make.trailing.equalTo(subBox).offset(-15)
        }
       divider2.snp.makeConstraints { make in
           make.bottom.equalTo(subBox.snp.bottom)
           make.trailing.leading.equalTo(container)
           make.height.equalTo(1)
       }
        bottomBox.snp.makeConstraints { make in
            make.top.equalTo(divider2.snp.bottom)
            make.leading.trailing.equalTo(container)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(bottomBox).offset(10)
            make.bottom.equalTo(bottomBox).offset(-10)
            make.leading.equalTo(bottomBox.snp.leading)
            make.width.equalTo(commentButton).multipliedBy(1.4)
        }
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(bottomBox).offset(10)
            make.bottom.equalTo(bottomBox).offset(-10)
            make.leading.equalTo(shareButton.snp.trailing).offset(5)
            make.width.equalTo(55)
        }
        divider.snp.makeConstraints { make in
            make.top.equalTo(bottomBox.snp.bottom)
            make.bottom.leading.trailing.equalTo(container)
            make.height.equalTo(11)
        }
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
