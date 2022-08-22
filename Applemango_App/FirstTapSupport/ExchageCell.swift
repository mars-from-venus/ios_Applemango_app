//
//  exchageCell.swift
//  segue_example2
//
//  Created by mars on 2022/02/11.
//

import UIKit
import SnapKit

class ExchageCell: UITableViewCell {
    
    static var identifier = "exchangeCell"
    
    lazy var cellStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameStack,coinPrice,changeStack,coinPremium])
        view.axis = .horizontal
        view.distribution = .fillEqually
        
        return view
    }()
    
    lazy var nameStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [exchangeName,exchangeNameSub])
        view.alignment = .leading
        view.axis = .vertical
        
        return view
    }()
    
    lazy var changeStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [coinChangable,coinChagePrice])
        view.alignment = .trailing
        view.axis = .vertical
        
        return view
    }()
    
    lazy var exchangeName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        
        return lbl
    }()
    
    lazy var exchangeNameSub: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.appColor(.grayTextColor)
        lbl.font = UIFont.systemFont(ofSize: 11)
        
        return lbl
    }()
    
    lazy var coinPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .right
        
        return lbl
    }()
    
    lazy var coinChangable: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.appColor(.mainColor)
        lbl.font = UIFont.systemFont(ofSize: 14)
        
        return lbl
    }()
    
    lazy var coinChagePrice: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.appColor(.mainColor)
        lbl.font = UIFont.systemFont(ofSize: 11)

        return lbl
    }()
    
    lazy var coinPremium: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.2886071801, green: 0.6478788257, blue: 0.2914767861, alpha: 1)

        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addLayout() {
        cellStack.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).offset(15)
            $0.trailing.bottom.equalTo(contentView).offset(-15)
        }
    }
    
    private func addView() {
        contentView.addSubview(cellStack)
    }

}
