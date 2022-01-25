//
//  UIColor.swift
//  segue_example2
//
//  Created by mars on 2022/01/26.
//

import UIKit

enum Colors {
    case backGray
}

extension UIColor {
    static func appColor(_ name: Colors) -> UIColor {
        switch name {
        case .backGray:
            return #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        }
    }
}
