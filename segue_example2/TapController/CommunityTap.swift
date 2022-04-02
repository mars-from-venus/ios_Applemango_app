//
//  ViewController.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

class CommunityTap: UIViewController {
    
    @IBOutlet var buttonView: UIView!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!
    @IBOutlet var button3 : UIButton!
    @IBOutlet var button4 : UIButton!
    @IBOutlet var button5 : UIButton!
    
    private var boardData : [BoardInfo] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingBtn()
        naviTitleChange(name: "커뮤니티")
        rightBarBtnGroup()
        DataManager.shared.loginTest()
        tableUtil()
        DataManager.shared.getBoardList(boardId: 1){ response in
            self.boardData.append(contentsOf: response.posts!)
            self.myTableView.reloadData()
        }
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
    }
    
    @objc func pullToRefresh(_ sender: Any){
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1){
            DataManager.shared.getBoardList(boardId: 1) { res in
                self.boardData = res.posts!
                self.myTableView.reloadData()
                self.myTableView.refreshControl?.endRefreshing()
            }
        }
    }
    func tableUtil(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.appColor(.backGray)
        myTableView.rowHeight = 240
        myTableView.refreshControl = UIRefreshControl()
        myTableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        myTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0); // 레이아웃 마진
    }
    
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
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

extension CommunityTap: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! SecondTapCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.lblTitle.text = boardData[indexPath.row].title
        cell.lblNick.text = boardData[indexPath.row].nickname
        
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
//Floating Button
extension CommunityTap {
    func floatingBtn(){
        let actionButton = JJFloatingActionButton()
        actionButton.buttonImage = UIImage(named: "pencileImage")
        actionButton.buttonImageSize = CGSize(width: 75, height: 75)
        actionButton.isHighlighted = true
        actionButton.addItem(title: "write", image: UIImage(named: "writeImage")?.withRenderingMode(.alwaysTemplate)) { item in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WritingPageController")
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
            DataManager.shared.loginTest()
        }
        actionButton.handleSingleActionDirectly = true
        self.view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
}
