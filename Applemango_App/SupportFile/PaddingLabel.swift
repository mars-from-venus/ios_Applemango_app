//
//  PaddingLabel2.swift
//  segue_example2
//
//  Created by hs on 2022/02/07.
//

import UIKit

//label에 padding값 바로 줌.
class PaddingLabel: UILabel {
    
    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8)

    override func drawText(in rect: CGRect) {
        let paddingRect = rect.inset(by: padding)
        super.drawText(in: paddingRect)
   }
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
       contentSize.width += padding.left + padding.right
       return contentSize
   }
}

class PaddingProfileLabel: UILabel {
    
    private var padding: UIEdgeInsets = UIEdgeInsets(top: 8, left: 128, bottom: 8, right: 128)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        let paddingRect = rect.inset(by: padding)
        super.drawText(in: paddingRect)
   }
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
       contentSize.width += padding.left + padding.right
       return contentSize
   }
}

