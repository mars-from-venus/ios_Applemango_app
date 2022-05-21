//
//  ViewController.swift
//  Applemango_App
//
//  Created by mars on 2022/05/21.
//

import UIKit

class EditProfilePage: UIViewController {
    
    lazy var ad: UILabel = {
        let lbl = UILabel()
        lbl.text = "123123"
        return lbl
    }()
    
    lazy var leftBarbutton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "backIcon"), style: .plain, target: self, action: #selector(popNavi))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "프로필 수정"
        self.view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = leftBarbutton
        self.tabBarController?.tabBar.isHidden = true
        lblAuto()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @objc func popNavi(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func lblAuto(){
        ad.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(ad)
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
