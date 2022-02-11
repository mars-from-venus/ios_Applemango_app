//
//  ViewController.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

class SecondTapViewController: UIViewController, YourCellDelegate2 {
    func didPressButton(_ tag: Int) {
        print("I have pressed a button with a tag: (tag)")
    }
    
    @IBOutlet var buttonView: UIView!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!
    @IBOutlet var button3 : UIButton!
    @IBOutlet var button4 : UIButton!
    @IBOutlet var button5 : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingBtn()
        naviTitleChange(name: "커뮤니티")
        rightBarBtnGroup()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.appColor(.backGray)
        self.myTableView.rowHeight = 240
//        self.myTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0); // 레이아웃 마진
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
        btn.setImage(image, for: .normal)     //     btn.addTarget(self, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtn = UIBarButtonItem(customView: btn)
        return barBtn
    }
    
    func rightBarBtnGroup(){
        let rightBarButton1 = self.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = self.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = self.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
     
     
    func naviTitleChange(name:String){
         if let navigationBar = self.navigationController?.navigationBar {
             let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width / 1.65, height: navigationBar.frame.height)
             let firstLabel = UILabel(frame: firstFrame)
             firstLabel.text = "\(name)"
             firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
             firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
             //이 페이지만 적용할땐 navigationItem 사용, 전체 네비에 적용할땐 navigationBar 사용
             self.navigationItem.titleView = firstLabel
         }
     }
     
    func addToView(_ withIdentifier:UIViewController.Type){
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "\(withIdentifier)")
        print(vcName!)
//        self.myView.addSubview(vcName!.self.view)
//        myView.layer.masksToBounds = true
    }
     
     @IBAction func moveToView2(_ sender: UIButton){
         addToView(HotBoard.self)
     }
     
     @IBAction func moveToView3(_ sender: UIButton){
         addToView(FreeBoard.self)
     }
     
     @IBAction func moveToView4(_ sender: UIButton){
         addToView(HumorBoard.self)
     }
     
     @IBAction func moveToView5(_ sender:UIButton){
         addToView(QABoard.self)
     }
     
     @IBAction func moveToView6(_ sender:UIButton){
         addToView(ChartBoard.self)
     }
}

extension SecondTapViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! SecondTapTableViewCell
        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 15
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
            footerView.backgroundColor = UIColor.clear
            return footerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }

}
