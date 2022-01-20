//
//  ThirdTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit

class ThirdTapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleChange()
    }
    func naviTitleChange(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 25, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "블록체인"
            firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
            navigationBar.addSubview(firstLabel)
        }
    }
    
}
