//
//  MyTap22.swift
//  segue_example2
//
//  Created by hs on 2022/03/17.
//

import Foundation
import UIKit
        
class MyTap : UIViewController{
    
    private let barButton : UIBarButtonItem = {
        let button = UIButton()
        let barbutton = UIBarButtonItem(customView: button)
        button.setImage(#imageLiteral(resourceName: "settingIcon"), for: .normal)
        
        return barbutton
    }()
    private let profileView : UIView = {
        let customView = UIView()
        
        return customView
    }()
    private let profileImage : UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "profileIcon")
        imageView.image = image
        
        return imageView
    }()
    private let nickname : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.black
        label.text = "유저 닉네임"
        
        return label
    }()
    private let subNickname : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.appColor(.grayTextColor)
        label.text = "유저 닉네임"
        
        return label
    }()
    private let editButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        
        return button
    }()
    @objc func editProfile(_ sender: Any){
//         let vc = EditProfilePage()
//        vc.modalPresentationStyle = .automatic
//        self.present(vc, animated: true)
        let vc = EditProfilePage()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let levelLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.text = "회원등급"
        
        return label
    }()
    private let assetLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.text = "자산 규모"
        
        return label
    }()
    private let assetImage1 : UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "levelIcon")
        imageView.image = image

        return imageView
    }()
    private let assetImage2 : UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "levelIcon")
        imageView.image = image

        return imageView
    }()
    private let authButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("자산 규모 인증하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        button.layer.cornerRadius = 10
        
        return button
    }()
    private let progressiveBar : UIProgressView = {
        let bar = UIProgressView()
        bar.progressViewStyle = .default
        bar.progressTintColor = UIColor.appColor(.mainColor)
        bar.trackTintColor = UIColor.appColor(.backGray)
        bar.clipsToBounds = true
        bar.layer.cornerRadius = 5
        bar.progress = 0.5
        
        return bar
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
    
        return tableView
    }()
    private let dvider : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.backGray)

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        autoLayout()
        naviTitleChange()
        tableViewUtil()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileView.layer.addBorder([.top,.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
    }
    
    func tableViewUtil(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTabCell.self, forCellReuseIdentifier: "MyTabCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    func naviTitleChange(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width / 1.2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "MY"
            firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.navigationItem.titleView = firstLabel
//            navigationBar.addSubview(firstLabel)
        }
    }
}


extension MyTap : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTabCell", for: indexPath) as? MyTabCell else { return UITableViewCell() }
        cell.selectionStyle = .none
//        cell.layer.addBorder([.top], color: UIColor.appColor(.borderColor), width: 0.5)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.label.text = MockData.myList[indexPath.row]
        
        return cell
    }
}
//Autolayout
extension MyTap {
    func addSubView(){
        self.view.addSubview(profileView)
        self.view.addSubview(dvider)
        self.view.addSubview(tableView)
        self.profileView.addSubview(profileImage)
        self.profileView.addSubview(nickname)
        self.profileView.addSubview(subNickname)
        self.profileView.addSubview(editButton)
        self.profileView.addSubview(levelLabel)
        self.profileView.addSubview(progressiveBar)
        self.profileView.addSubview(assetLabel)
        self.profileView.addSubview(authButton)
        self.profileView.addSubview(assetImage1)
        self.profileView.addSubview(assetImage2)
        self.navigationItem.rightBarButtonItem = barButton
    }
    func autoLayout(){
        let buttonInset : CGFloat = 22
        
        //profileView
        profileView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, bottom: nil, left: self.view.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0),size:.init(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: 375))
        profileImage.anchor(top: profileView.topAnchor, right: nil, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 55, height: 55))
        nickname.anchor(top: profileView.topAnchor, right: nil, bottom: subNickname.topAnchor, left: profileImage.rightAnchor, padding: .init(top: 30, left: 10, bottom: 5, right: 0))
        subNickname.anchor(top: nickname.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: profileImage.rightAnchor, padding: .init(top: 5, left: 11, bottom: 0, right: 220))
        editButton.anchor(top: profileImage.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 20, left: buttonInset, bottom: 0, right: buttonInset), size: .init(width:self.view.safeAreaLayoutGuide.layoutFrame.width - buttonInset * 2 , height: 40))
        levelLabel.anchor(top: editButton.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20),size: .init(width: profileView.frame.width, height: 20))
        assetImage1.anchor(top: levelLabel.bottomAnchor, right: nil, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 15, left: 15, bottom: 0, right:0),size: .init(width: 36, height: 36))
        assetImage2.anchor(top: levelLabel.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 15), size: .init(width: 36, height: 36))
        progressiveBar.anchor(top: assetImage1.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 5, left: 20, bottom: 0, right: 20),size:.init(width: profileView.frame.width, height: 11))
        assetLabel.anchor(top: progressiveBar.bottomAnchor, right: profileView.rightAnchor, bottom: nil , left: profileView.leftAnchor, padding: .init(top: 35, left: 20, bottom: 0, right: 20))
        authButton.anchor(top: assetLabel.bottomAnchor, right: profileView.rightAnchor, bottom: nil, left: profileView.leftAnchor, padding: .init(top: 15, left: 20, bottom: 30, right: 20),size: .init(width: editButton.frame.width, height: 40))
        
        //divider
        dvider.anchor(top: profileView.bottomAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, bottom: nil, left: self.view.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: 12))
        
        //tableView
        tableView.anchor(top: dvider.bottomAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0),size:.init(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: self.view.safeAreaLayoutGuide.layoutFrame.height - (profileView.frame.height + dvider.frame.height)))
    }
}
