//
//  ThirdTapCell.swift
//  segue_example2
//
//  Created by hs on 2022/02/09.
//

import UIKit
import SnapKit

protocol yourCellDelegate8:AnyObject {
    func pressButton(tag:Int)
}

class NewsTapCell: UITableViewCell {
    
    var cellDelegate : yourCellDelegate8?
    static let identifier = "newsCell"
    
    lazy var verticalView: UIStackView = {
        let view = UIStackView()
        self.contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.bottom.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        return view
    }()
    
    lazy var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillProportionally
        self.verticalView.addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(verticalView)
        }
        
        return view
    }()
    
    lazy var bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillProportionally
        self.verticalView.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(10)
        }
        
        return view
    }()
    
    lazy var lblNotice: UILabel = {
        let lbl = PaddingLabels(padding: UIEdgeInsets(top: 4, left: 6, bottom: 4, right: 6))
        lbl.text = "공지"
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lbl.layer.cornerRadius = 5
        lbl.textAlignment = .center
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.sizeToFit()
        contentView.addSubview(lbl)
        lbl.setContentHuggingPriority(.init(rawValue: 751), for: .horizontal)
        lbl.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.trailing.equalTo(lblTitle.snp.leading).offset(-15)
        }
        
        return lbl
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        lbl.text = "제목"
        contentView.addSubview(lbl)
        
        return lbl
    }()
    
    lazy var lblComment: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.text = "댓글 수 15"
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lbl)
        
        return lbl
    }()
    
    lazy var lblReviews: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.text = "조회 수 15"
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lbl)
        lbl.snp.makeConstraints { make in
            make.leading.equalTo(lblComment.snp.trailing).offset(7)
            make.trailing.equalTo(lblTime.snp.leading).offset(-7)
        }
        
        return lbl
    }()
    
    lazy var lblTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.text = "2022.05.05"
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lbl)

        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addStack()
    }
    
    private func addStack() {
        _ = [lblNotice,lblTitle].map {
             self.topStackView.addArrangedSubview($0)
         }
        _ = [lblComment,lblReviews,lblTime].map {
            self.bottomStackView.addArrangedSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }

}


