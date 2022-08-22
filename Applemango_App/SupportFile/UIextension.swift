//
//  UIextension.swift
//  segue_example2
//
//  Created by mars on 2022/04/03.
//

import Foundation
import UIKit

extension UINavigationItem {
    func makeCustomNavigationButton(imageName: String) -> UIBarButtonItem{
        let image = UIImage(named: imageName)!
        let btn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image, for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtn = UIBarButtonItem(customView: btn)
        return barBtn
    }
}

extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}

extension UINavigationBar {
    func naviTitleChange(_ view: UIViewController, _ title: String){
        if let navigationBar = view.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 30, y: 0, width: navigationBar.frame.width / 2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = title
            firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
            navigationBar.addSubview(firstLabel)
            //navigationItem.titleview 사용시 현재페이지만 적용가능
        }
    }
}
