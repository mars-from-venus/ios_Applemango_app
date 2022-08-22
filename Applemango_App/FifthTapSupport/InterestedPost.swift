//
//  InterestedPost.swift
//  Applemango_App
//
//  Created by mars on 2022/05/23.
//

import UIKit
import SnapKit

class InterestedPost: UIViewController {
    
    var boardList : [BoardInfo]?
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
    
        return tableView
    }()
    
    lazy var leftBarbutton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "backIcon"), style: .plain, target: self, action: #selector(popNavi))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        self.title = "관심 게시물"
        self.view.addSubview(tableView)
        self.navigationItem.leftBarButtonItem = leftBarbutton
        tableUtil()
        tableLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func tableUtil(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.register(BoardTableCell.self, forCellReuseIdentifier: "MyCell")
    }
    
    private func tableLayout(){
        tableView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    @objc private func popNavi(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension InterestedPost : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! BoardTableCell
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
}
