//
//  ViewController.swift
//  Applemango_App
//
//  Created by mars on 2022/05/21.
//

import UIKit

class EditProfilePage: UIViewController {
    
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissModal))
    
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = self.leftButton
        print("AAAA")
        // Do any additional setup after loading the view.
    }
    @objc func dismissModal(){
        self.dismissModal()
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
