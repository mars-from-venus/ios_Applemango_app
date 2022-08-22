//
//  ViewController.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

class CommunityTap: UIViewController {

    private let actionButton = JJFloatingActionButton()
    
    private static let buttonData: [MockButtonModel] = MockButton.getCoDataSource()
    
    private let buttonScrollView: ButtonScrollView = ButtonScrollView(data: buttonData)
    
    private lazy var myTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.appColor(.backGray)
        
        return view
    }()
    
    private var boardData : [BoardInfo] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        floatingBtn()
        rightBarBtnGroup()
        DataManager.shared.loginTest()
        layoutFunc()
        tableSetUp()
        naviSetUp()
        scrollviewSetUp()
        DataManager.shared.getBoardList(boardId: 1){ response in
            self.boardData.append(contentsOf: response.posts!)
            self.myTableView.reloadData()
        }
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
    

}

extension CommunityTap: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableCell.identifier, for: indexPath) as! BoardTableCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.lblTitle.text = boardData[indexPath.row].title
        cell.lblNick.text = boardData[indexPath.row].nickname
        if boardData[indexPath.row].like <= 50 {
            cell.lblHot.removeFromSuperview()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EntireBoardDetail") as? EntireBoardDetail
        vc?.boardInfo = boardData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

//Floating Button
extension CommunityTap {
    private func floatingBtn(){
        actionButton.buttonImage = UIImage(named: "pencileImage")
        actionButton.buttonImageSize = CGSize(width: 75, height: 75)
        actionButton.handleSingleActionDirectly = true
        actionButton.isHighlighted = true
        actionButton.addItem(title: "write", image: UIImage(named: "writeImage")?.withRenderingMode(.alwaysTemplate)) { item in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WritingPageController")
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
            DataManager.shared.loginTest()
        }
    }
}

extension CommunityTap {
    private func addView() {
        self.view.addSubview(buttonScrollView)
        self.view.addSubview(myTableView)
        self.view.addSubview(actionButton)
    }
    private func tableSetUp() {
        myTableView.register(BoardTableCell.self, forCellReuseIdentifier: BoardTableCell.identifier)
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.refreshControl = UIRefreshControl()
        myTableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    private func naviSetUp() {
        self.navigationController?.navigationBar.naviTitleChange(self, "커뮤니티")
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
    }
    private func scrollviewSetUp() {
        buttonScrollView.backgroundColor = UIColor.appColor(.backGray)
    }
    private func layoutFunc() {
        buttonScrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(50)
        }
        myTableView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(buttonScrollView.snp.bottom)
        }
        actionButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
    private func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
}
