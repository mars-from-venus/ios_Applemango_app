//
//  FirstTapViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/09.
//

import UIKit
import SnapKit
import DropDown

class ExchangeTap: UIViewController {
    
    private lazy var myView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [exchangeName,coinPrice,coinChangable,coinPremium])
        view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        
        return view
    }()
    
    private lazy var myTableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    private lazy var exchangeName: UILabel = {
        let lbl = UILabel()
        lbl.text = "거래소명"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    
    private lazy var coinPrice: UILabel = {
        let lbl = UILabel()
        lbl.text = "현재가"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textAlignment = .right
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    
    private lazy var coinChangable: UILabel = {
        let lbl = UILabel()
        lbl.text = "변동률"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textAlignment = .right
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
    
    private lazy var coinPremium: UILabel = {
        let lbl = UILabel()
        lbl.text = "한국 프리미엄"
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.appColor(.grayTextColor)
        
        return lbl
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.naviTitleChange(self, "거래소")
        addView()
        rightBarBtnGroup()
        border()
        tableUtil()
        addLayout()
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
    
    
//    func naviTitleChange(){
//        if let navigationBar = self.navigationController?.navigationBar {
//            let firstFrame = CGRect(x: 20, y: 0, width: navigationBar.frame.width/6, height: navigationBar.frame.height)
//            let naviTitle = UIButton(frame: firstFrame)
//            naviTitle.setTitle("거래소", for: .normal)
//            naviTitle.titleLabel?.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
//            naviTitle.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//            naviTitle.setTitleColor(.black, for: .normal)
//            naviTitle.addTarget(self, action: #selector(dropDownCuntom(_:)), for: .touchUpInside)
//            navigationBar.addSubview(naviTitle)
//        }
//    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchageCell.identifier) as? ExchageCell
        cell?.exchangeName.text = MockData.exchageTitle[indexPath.row]
        cell?.exchangeNameSub.text = "BTC/KRW"
        cell?.coinPrice.text = String(MockData.exchagePrice[indexPath.row])
        cell?.coinChangable.text = "+ 4%"
        cell?.coinChagePrice.text = "+ 1,200,000"
        cell?.coinPremium.text = "+ 2.3%"
        return cell!
    }
}

extension ExchangeTap {
    private func tableUtil() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.estimatedRowHeight = UITableView.automaticDimension
        myTableView.register(ExchageCell.self, forCellReuseIdentifier: ExchageCell.identifier)
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    private func addLayout() {
        myView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(self.view).offset(15)
            $0.trailing.equalTo(self.view).offset(-15)
        }
        myTableView.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(5)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    private func addView() {
        self.view.addSubview(myTableView)
        self.view.addSubview(myView)
    }
}
