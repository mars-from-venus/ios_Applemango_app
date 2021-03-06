//
//  FirstTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit
import DropDown

class ExchangeTap: UIViewController {

    @IBOutlet weak var myTableView:UITableView!
    @IBOutlet weak var myView:UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleChange()
        rightBarBtnGroup()
        border()
        tableUtil()
        DataManager.shared.loginTest()
    }
    
    func border(){
        myView.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 1)
        self.tabBarController?.tabBar.layer.addBorder([.top], color: UIColor.appColor(.borderColor), width: 1)
    }
    
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
    
    func tableUtil(){
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func naviTitleChange(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 20, y: 0, width: navigationBar.frame.width/6, height: navigationBar.frame.height)
            let naviTitle = UIButton(frame: firstFrame)
            naviTitle.setTitle("거래소", for: .normal)
            naviTitle.titleLabel?.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            naviTitle.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            naviTitle.setTitleColor(.black, for: .normal)
            naviTitle.addTarget(self, action: #selector(dropDownCuntom(_:)), for: .touchUpInside)
            navigationBar.addSubview(naviTitle)
        }
    }
    @objc func dropDownCuntom(_ anchor: UIButton){
        let dropDown = DropDown()
        dropDown.dataSource = ["BTC","ETH","XRP","TRX","ATOM","LINK"]
        dropDown.show()
        dropDown.anchorView = anchor
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.textFont = UIFont.systemFont(ofSize: 15)
        dropDown.cornerRadius = 15
        dropDown.selectedTextColor = .white
        dropDown.selectionBackgroundColor = UIColor.appColor(.mainColor)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//                guard let _ = self else { return }
            anchor.setTitle(item, for: .normal)
            print("인덱스 : \(index)")
//                test apply
        }
    }
    
}

extension ExchangeTap:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ExchageCell
        cell?.exchangeName.text = MockData.exchageTitle[indexPath.row]
        cell?.coinPrice.text = String(MockData.exchagePrice[indexPath.row])
        return cell!
    }
}
