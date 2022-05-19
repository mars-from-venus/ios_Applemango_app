//
//  FourthViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit

class ChatTap: UIViewController, YourCellDelegate7 {
    func didPress(_ tag: Int) {
        print(tag)
    }
    
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleChange(name:"채팅")
        rightBarBtnGroup()
        myTableView.dataSource = self
        myTableView.delegate = self
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
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
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }

}

extension ChatTap: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! FourthTapCell
        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }

}
