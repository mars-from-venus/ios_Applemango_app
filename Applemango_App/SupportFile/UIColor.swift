//
//  UIColor.swift
//  segue_example2
//
//  Created by mars on 2022/01/26.
//

import UIKit

enum Colors {
    case backGray
    case mainColor
    case grayTextColor
    case borderColor
    case shareGrayColor
}

extension UIColor {
    static func appColor(_ name: Colors) -> UIColor {
        switch name {
        case .backGray:
            return #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        case .mainColor:
            return #colorLiteral(red: 0.937254902, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
        case .grayTextColor:
            return #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 1)
        case .borderColor:
            return #colorLiteral(red: 0.8156862745, green: 0.8156862745, blue: 0.8156862745, alpha: 1)
        case .shareGrayColor:
            return #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        }
    }
    
}
