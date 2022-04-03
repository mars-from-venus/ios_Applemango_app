//
//  ViewController5.swift
//  segue_example2
//
//  Created by mars on 2022/01/01.
//

import UIKit
import JJFloatingActionButton

class QABoard: UIViewController{
    @IBOutlet var myTableView : UITableView!
    
    private var boardData : [BoardInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        floatingBtn()
        tableUtil()
        rightBarBtnGroup()
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
        DataManager.shared.getBoardList(boardId: 5){ response in
            self.boardData.append(contentsOf: response.posts!)
            self.myTableView.reloadData()
        }
    }
    @objc func pullToRefresh(_ sender: Any){
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1){
            DataManager.shared.getBoardList(boardId: 5) { res in
                self.boardData = res.posts!
                self.myTableView.reloadData()
                self.myTableView.refreshControl?.endRefreshing()
            }
        }
    }

    func tableUtil(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = 240
        myTableView.refreshControl = UIRefreshControl()
        myTableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        myTableView.register(BoardTableCell.self, forCellReuseIdentifier: "myCell")
    }

    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
}

extension QABoard: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boardData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! BoardTableCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        //셀 구분선 처음부터 끝까지
        cell.separatorInset = UIEdgeInsets.zero
        cell.lblBoard.text = "질문"
        cell.lblTitle.text = boardData[indexPath.row].title
        cell.lblNick.text = boardData[indexPath.row].nickname
        if boardData[indexPath.row].like <= 50 {
            cell.lblHot.removeFromSuperview()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }
}

extension QABoard {
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
