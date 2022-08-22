//
//  ButtonScrollView.swift
//  Applemango_App
//
//  Created by mars on 2022/08/16.
//

import UIKit

class ButtonScrollView: UIScrollView {
    
    private let insets: UIEdgeInsets = UIEdgeInsets(top: 7, left: 9, bottom: 7, right: 9)
    var dataSource: [MockButtonModel]?
        
    let contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 15

        return view
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        layoutFunc()
    }
    
    convenience init(data: [MockButtonModel]) {
        self.init()
        self.dataSource = data
        buttonAdded()
    }
}

extension ButtonScrollView {
    private func addView() {
        self.addSubview(contentView)
    }
    private func layoutFunc() {
        contentView.snp.makeConstraints {
            $0.leading.equalTo(self).offset(15)
            $0.trailing.equalTo(self).offset(-15)
            $0.centerY.equalTo(self)
        }
    }
    private func buttonAdded() {
        dataSource?.forEach { data in
            let lbl = PaddingLabels(padding: insets)
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
            lbl.text = data.title
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.font = UIFont.systemFont(ofSize: 12)
            lbl.clipsToBounds = true
            lbl.layer.cornerRadius = 5
            lbl.backgroundColor = UIColor.appColor(.mainColor)
            lbl.isUserInteractionEnabled = true
            lbl.addGestureRecognizer(tap)
            
            contentView.addArrangedSubview(lbl)
        }
    }
    
    @objc func tapAction(sender: UIGestureRecognizer) {
        let view = sender.view as! UILabel
        print(view.text!)
    }
}
