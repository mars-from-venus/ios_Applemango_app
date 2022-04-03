//
//  BoardDetailView.swift
//  segue_example2
//
//  Created by mars on 2022/04/03.
//

import UIKit
import SnapKit

class BoardDetailView: UIView {
    
    private lazy var container : UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var lblTypeBox : UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var lblBox : UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var contentBox : UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var bottomBox : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        view.layer.borderWidth = 1
        
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
    lazy var profileImage : UIImageView = {
        let imgView = UIImageView()
        let image = #imageLiteral(resourceName: "profileIcon")
        imgView.image = image
        
        return imgView
    }()
    lazy var lblNick : UILabel = {
        let lbl = UILabel()
        lbl.text = "유저 닉네임"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        return lbl
    }()
    lazy var lblCnt : UILabel = {
        let lbl = UILabel()
        lbl.text = "View 100"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    lazy var lblTime : UILabel = {
        let lbl = UILabel()
        lbl.text = "10분 전"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    lazy var shareImage : UIImageView = {
        let imgView = UIImageView()
        let image = #imageLiteral(resourceName: "Icon feather-share")
        imgView.image = image
        
        return imgView
    }()
    lazy var kebabImage : UIImageView = {
        let imgView = UIImageView()
        let image = #imageLiteral(resourceName: "kebabIcon")
        imgView.image = image
        
        return imgView
    }()
    lazy var lblContent : UITextView = {
        let lbl = UITextView()
        lbl.text = "글 내용"
        lbl.isEditable = false
        lbl.font = UIFont.systemFont(ofSize: 13)
        
        return lbl
    }()
    lazy var reportButton : UIButton = {
        let button = UIButton()
        button.setTitle("부적절한 게시글 신고하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(UIColor.appColor(.grayTextColor), for: .normal)
        button.setImage(UIImage(named: "sirenIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.imageEdgeInsets = .init(top: 0, left:-10, bottom: 0, right: 3)
        
        return button
    }()
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.setTitle("공감하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(UIColor.appColor(.shareGrayColor), for: .normal)
        button.setImage(UIImage(named: "smileIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.imageEdgeInsets = .init(top: 0, left:-6, bottom: 0, right: 8)
        
        return button
    }()
    lazy var commentButton : UIButton = {
        let button = UIButton()
        button.setTitle("댓글", for: .normal)
        button.setTitleColor(UIColor.appColor(.shareGrayColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setImage(UIImage(named: "talkIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.imageEdgeInsets = .init(top: 0, left:-6, bottom: 0, right: 8)
        
        return button
    }()
    lazy var divider : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.addSubview(container)
        container.addSubview(lblBox)
        container.addSubview(divider)
        container.addSubview(contentBox)
        container.addSubview(bottomBox)
        lblBox.addSubview(lblTypeBox)
        lblBox.addSubview(profileImage)
        lblBox.addSubview(lblNick)
        lblBox.addSubview(lblCnt)
        lblBox.addSubview(lblTime)
        lblBox.addSubview(shareImage)
        lblBox.addSubview(kebabImage)
        lblTypeBox.addSubview(lblBoard)
        contentBox.addSubview(lblContent)
        contentBox.addSubview(reportButton)
        bottomBox.addSubview(shareButton)
        bottomBox.addSubview(commentButton)
    }
    
    private func setConstraints(){
        container.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        lblBox.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(container)
        }
        lblTypeBox.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(lblBox)
            make.width.equalTo(lblBox)
            make.height.equalTo(40)
        }
        lblBoard.snp.makeConstraints { make in
            make.top.equalTo(lblTypeBox).offset(18)
            make.leading.equalTo(lblTypeBox).offset(20)
            make.bottom.equalTo(lblTypeBox)
        }
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(lblTypeBox.snp.bottom).offset(15)
            make.leading.equalTo(lblBox).offset(18)
        }
        lblNick.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(10)
            make.top.equalTo(lblTypeBox.snp.bottom).offset(15)
        }
        lblCnt.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
            make.top.equalTo(lblNick.snp.bottom).offset(5)
            make.bottom.equalTo(lblBox.snp.bottom)
        }
        lblTime.snp.makeConstraints { make in
            make.leading.equalTo(lblCnt.snp.trailing).offset(10)
            make.bottom.equalTo(lblBox)
        }
        divider.snp.makeConstraints { make in
            make.top.equalTo(lblBox.snp.bottom).offset(15)
            make.trailing.equalTo(lblBox).offset(-20)
            make.leading.equalTo(lblBox).offset(20)
            make.height.equalTo(1)
        }
        contentBox.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.trailing.leading.equalTo(container)
        }
        lblContent.snp.makeConstraints { make in
            make.top.equalTo(contentBox).offset(10)
            make.leading.equalTo(contentBox).offset(20)
            make.trailing.equalTo(contentBox).offset(-20)
            make.height.equalTo(160)
        }
        reportButton.snp.makeConstraints { make in
            make.top.equalTo(lblContent.snp.bottom).offset(8)
            make.leading.equalTo(contentBox).offset(20)
            make.bottom.equalTo(contentBox).offset(-10)
        }
        bottomBox.snp.makeConstraints { make in
            make.top.equalTo(contentBox.snp.bottom).offset(8)
            make.trailing.leading.bottom.equalTo(container)
        }
        shareImage.snp.makeConstraints { make in
            make.bottom.equalTo(lblBox).offset(-15)
            make.trailing.equalTo(kebabImage.snp.leading).offset(-20)
        }
        kebabImage.snp.makeConstraints { make in
            make.bottom.equalTo(lblBox).offset(-15)
            make.trailing.equalTo(lblBox).offset(-20)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(bottomBox).offset(12)
            make.leading.equalTo(bottomBox).offset(25)
            make.trailing.equalTo(commentButton.snp.leading).offset(-30)
            make.bottom.equalTo(bottomBox).offset(-12)
        }
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(bottomBox).offset(12)
            make.bottom.equalTo(bottomBox).offset(-12)
        }
    }

}
