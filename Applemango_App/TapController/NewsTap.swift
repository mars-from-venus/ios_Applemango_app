//
//  ThirdTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit

class NewsTap: UIViewController, yourCellDelegate8 {
    func pressButton(tag: Int) {
        print(123)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        naviTitleChange()
        rightBarBtnGroup()
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
    }
    func naviTitleChange(){
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 30, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "블록체인"
            firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
            firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
            navigationBar.addSubview(firstLabel)
        }
    }
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
    
    
}

extension NewsTap: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.tableTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ThirdTapCell
        cell.cellDelegate = self
        cell.lblTitle.text = MockData.tableTitle[indexPath.row]
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
