//
//  PaddingLabel2.swift
//  segue_example2
//
//  Created by hs on 2022/02/07.
//

import UIKit

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
