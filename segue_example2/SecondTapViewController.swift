//
//  ViewController.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

 class SecondTapViewController: UIViewController {
    
     @IBOutlet var buttonView: UIView!
     @IBOutlet var myView : UIView!
     @IBOutlet var button1 : UIButton!
     @IBOutlet var button2 : UIButton!
     @IBOutlet var button3 : UIButton!
     @IBOutlet var button4 : UIButton!
     @IBOutlet var button5 : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        floatingBtn()
        naviTitleChange()
        addToView(ViewController3.self)
        let rightBarButton1 = self.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = self.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = self.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }

     
     func floatingBtn(){
         let actionButton = JJFloatingActionButton()
         actionButton.buttonImage = UIImage(named: "pencileImage")
         actionButton.buttonImageSize = CGSize(width: 75, height: 75)
         actionButton.isHighlighted = true
         actionButton.addItem(title: "write", image: UIImage(named: "writeImage")?.withRenderingMode(.alwaysTemplate)) { item in
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "WritingPageController")
             vc!.modalPresentationStyle = .fullScreen
             self.present(vc!, animated: true)
         }
         actionButton.handleSingleActionDirectly = true
         self.view.addSubview(actionButton)
         actionButton.translatesAutoresizingMaskIntoConstraints = false
         actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
         actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
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
     
     
     func naviTitleChange(){
         if let navigationBar = self.navigationController?.navigationBar {
             let firstFrame = CGRect(x: 25, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
             let firstLabel = UILabel(frame: firstFrame)
             firstLabel.text = "커뮤니티"
             firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
             firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
             navigationBar.addSubview(firstLabel)
         }
     }
     
    func addToView(_ withIdentifier:UIViewController.Type){
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "\(withIdentifier)")
        self.myView.addSubview(vcName!.self.view)
        myView.layer.masksToBounds = true
    }
    
    @IBAction func moveToView2(_ sender: UIButton){
        addToView(ViewController2.self)
    }
    
    @IBAction func moveToView3(_ sender: UIButton){
        addToView(ViewController3.self)
        
    }
    
    @IBAction func moveToView4(_ sender: UIButton){
        addToView(ViewController4.self)
    }
     @IBAction func moveToView5(_ sender:UIButton){
         addToView(ViewController5.self)
     }
     @IBAction func moveToView6(_ sender:UIButton){
         addToView(ViewController6.self)
     }
}

