//
//  ThirdTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit
import SnapKit

class NewsTap: UIViewController, yourCellDelegate8 {
    func pressButton(tag: Int) {
        print(123)
    }
    
    private static let buttonData: [MockButtonModel] = MockButton.getDataSource()
    
    private let buttonScrollView: ButtonScrollView = ButtonScrollView(data: buttonData)
    
    private lazy var myTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        scrollViewSetUp()
        tableSetUp()
        naviSetUp()
        rightBarBtnGroup()
        layoutFunc()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTapCell.identifier) as? NewsTapCell ?? NewsTapCell()
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
}

extension NewsTap {
    private func addView() {
        self.view.addSubview(buttonScrollView)
        self.view.addSubview(myTableView)
    }
    private func naviSetUp() {
        self.navigationController?.navigationBar.naviTitleChange(self, "블록체인")
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 0.5)
    }
    private func tableSetUp() {
        myTableView.register(NewsTapCell.self, forCellReuseIdentifier: NewsTapCell.identifier)
        myTableView.rowHeight = UITableView.automaticDimension
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
    }
    private func rightBarBtnGroup() {
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
    private func scrollViewSetUp() {
        buttonScrollView.backgroundColor = UIColor.appColor(.backGray)
    }
}
