//
//  CommentCell.swift
//  segue_example2
//
//  Created by mars on 2022/04/05.
//

import UIKit
import SnapKit

class CommentCell: UITableViewCell {
    lazy var container : UIView = {
        let view = UIView()
        
        return view
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
    lazy var lblInfo : UILabel = {
        let lbl = UILabel()
        lbl.text = "유저 정보"
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
    lazy var lblContent : UILabel = {
        let lbl = UILabel()
        lbl.text = "댓글 내용"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.black
        
        return lbl
    }()
    lazy var lblRes : UILabel = {
        let lbl = UILabel()
        lbl.text = "유저 닉네임"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        return lbl
    }()
    lazy var lblLike : UILabel = {
        let lbl = UILabel()
        lbl.text = "좋아요"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    lazy var lblResWrite : UILabel = {
        let lbl = UILabel()
        lbl.text = "답글쓰기"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    lazy var kebabImage : UIImageView = {
        let imgView = UIImageView()
        let image = #imageLiteral(resourceName: "kebabIcon")
        imgView.image = image
        
        return imgView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.contentView.addSubview(container)
        container.addSubview(profileImage)
        container.addSubview(lblNick)
        container.addSubview(lblInfo)
        container.addSubview(lblTime)
        container.addSubview(lblContent)
        container.addSubview(lblRes)
        container.addSubview(lblLike)
        container.addSubview(lblResWrite)
        container.addSubview(kebabImage)
    }
    
    private func setConstraints(){
        container.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(contentView)
        }
        profileImage.snp.makeConstraints { make in
            make.top.leading.equalTo(container).offset(15)
        }
        lblNick.snp.makeConstraints { make in
            make.top.equalTo(container).offset(15)
            make.leading.equalTo(profileImage.snp.trailing).offset(10)
        }
        lblInfo.snp.makeConstraints { make in
            make.top.equalTo(lblNick.snp.bottom).offset(5)
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        lblTime.snp.makeConstraints { make in
            make.leading.equalTo(lblInfo.snp.trailing).offset(20)
            make.top.equalTo(container).offset(36)
        }
        lblContent.snp.makeConstraints { make in
            make.top.equalTo(lblInfo.snp.bottom).offset(10)
            make.leading.equalTo(container).offset(56)
            make.trailing.equalTo(container).offset(-50)
            make.width.equalTo(container)
        }
        lblLike.snp.makeConstraints { make in
            make.top.equalTo(lblContent.snp.bottom).offset(10)
            make.leading.equalTo(container).offset(55)
            make.bottom.equalTo(container).offset(-5)
        }
        lblResWrite.snp.makeConstraints { make in
            make.leading.equalTo(lblLike.snp.trailing).offset(15)
            make.top.equalTo(lblContent.snp.bottom).offset(10)
            make.bottom.equalTo(container).offset(-5)
        }
        kebabImage.snp.makeConstraints { make in
            make.trailing.equalTo(container).offset(-15)
            make.top.equalTo(container).offset(20)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
