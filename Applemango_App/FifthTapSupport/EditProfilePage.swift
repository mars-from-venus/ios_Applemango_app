//
//  ViewController.swift
//  Applemango_App
//
//  Created by mars on 2022/05/21.
//

import UIKit
import SnapKit

class EditProfilePage: UIViewController {
    
    lazy var leftBarbutton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "backIcon"), style: .plain, target: self, action: #selector(popNavi))
        return button
    }()
    
    lazy var lblNick : UILabel = {
        let lbl = PaddingProfileLabel()
        lbl.text = "유저 닉네임"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lbl.layer.cornerRadius = 10
                
        return lbl
    }()
    
    lazy var registButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.8959311247, green: 0.8926985264, blue: 0.8926302791, alpha: 1)
        btn.tintColor = .white
        btn.setTitle("완료", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        
        return btn
    }()
        
    lazy var profileImage : UIImageView = {
        let imgView = UIImageView()
        let img = #imageLiteral(resourceName: "profileIcon")
        imgView.image = img
        imgView.layer.zPosition = 1
        
        return imgView
    }()
    
    lazy var cameraView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.zPosition = 2
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 14
        view.layer.borderColor = UIColor.appColor(.borderColor).cgColor

        return view
    }()
    
    lazy var cameraImage : UIImageView = {
        let imgView = UIImageView()
        let img = #imageLiteral(resourceName: "Icon ionic-ios-camera")
        imgView.image = img.withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -3, bottom: -5, right: -3))
        imgView.layer.masksToBounds = true
        imgView.contentMode = UIView.ContentMode.scaleAspectFit
        imgView.center = self.view.center

        return imgView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "프로필 수정"
        self.view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = leftBarbutton
        self.tabBarController?.tabBar.isHidden = true
        addsubView()
        addLayout()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @objc private func popNavi(){
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EditProfilePage {
    private func addsubView(){
        self.view.addSubview(profileImage)
        self.view.addSubview(lblNick)
        self.view.addSubview(registButton)
        self.view.addSubview(cameraView)
        self.cameraView.addSubview(cameraImage)
    }
    private func addLayout(){
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.width.height.equalTo(118)
            make.centerX.equalTo(self.view)
        }
        lblNick.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(35)
            make.centerX.equalTo(self.view)
        }
        registButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self.view)
            make.height.equalTo(80)
        }
        cameraView.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(-24)
            make.bottom.equalTo(lblNick.snp.top).offset(-45)
        }
        cameraImage.snp.makeConstraints { make in
            make.leading.top.equalTo(cameraView).offset(3)
            make.trailing.bottom.equalTo(cameraView).offset(-3)
        }
    }
}
