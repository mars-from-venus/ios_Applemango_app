//
//  MyTabCell.swift
//  segue_example2
//
//  Created by mars on 2022/03/20.
//

import UIKit

class MyTabCell: UITableViewCell {
    
    let label : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "Icon ionic-ios-arrow-back")
        imageView.image = image
        
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        contentView.addSubview(label)
        contentView.addSubview(image)
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.anchor(top: contentView.topAnchor, right: image.leftAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor,padding: .init(top: 25, left: 20, bottom: 25, right: 100))
        image.anchor(top: contentView.topAnchor, right: contentView.rightAnchor
                     , bottom: nil, left: nil, padding: .init(top: 25, left: 0, bottom: 0, right: 25))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
