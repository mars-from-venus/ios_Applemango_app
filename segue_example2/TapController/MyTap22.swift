//
//  MyTap22.swift
//  segue_example2
//
//  Created by hs on 2022/03/17.
//

import Foundation
import UIKit
        
class MyTap22 : UIViewController{
    
    let profileView : UIView = {
        let view = UIView()
        let navigation = UINavigationBar()
        view.frame = CGRect(x: 0, y: navigation.frame.height, width: view.frame.width, height: view.frame.height / 2 )
        
        return view
    }()
    let image : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        let image = #imageLiteral(resourceName: "profileIcon")
        imageView.image = image
        
        return imageView
    }()
    let nickname : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        
        return label
    }()
    let subNickname : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.appColor(.grayTextColor)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
    }
    
    func addSubView(){
        self.view.addSubview(profileView)
        self.profileView.addSubview(image)
        self.profileView.addSubview(nickname)
        self.profileView.addSubview(subNickname)
    }
}
