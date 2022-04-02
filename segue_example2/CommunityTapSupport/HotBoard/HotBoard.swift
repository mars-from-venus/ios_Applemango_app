//
//  ViewController2.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

class HotBoard: UIViewController{

    @IBOutlet var myTableView : UITableView!
    
    private var boardData : [BoardInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBarBtnGroup()
        tableUtil()
        floatingBtn()
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
        DataManager.shared.getBoardList(boardId: 2){ response in
            self.boardData.append(contentsOf: response.posts!)
            self.myTableView.reloadData()
        }
    }
    
    @objc func pullToRefresh(_ sender: Any){
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1){
            DataManager.shared.getBoardList(boardId: 2) { res in
                self.boardData = res.posts!
                self.myTableView.reloadData()
                self.myTableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    private func tableUtil(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = 240
        myTableView.refreshControl = UIRefreshControl()
        myTableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
}

extension HotBoard: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boardData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! HotBoardCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        //셀 구분선 처음부터 끝까지
        cell.separatorInset = UIEdgeInsets.zero
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
        footerView.backgroundColor = UIColor.appColor(.backGray)
            return footerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }
}

extension HotBoard {
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

