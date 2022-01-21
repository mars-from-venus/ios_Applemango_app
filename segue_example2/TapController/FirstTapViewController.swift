//
//  FirstTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit

class FirstTapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleChange()
        let rightBarButton1 = self.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = self.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = self.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
    
    func naviTitleChange(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 25, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "거래소"
            firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
            navigationBar.addSubview(firstLabel)
        }
    }
    func makeCustomNavigationButton(imageName: String) -> UIBarButtonItem{
        let image = UIImage(named: imageName)!
        let btn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image, for: .normal)
        //     btn.addTarget(self, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtn = UIBarButtonItem(customView: btn)
        
        return barBtn
    }
}
