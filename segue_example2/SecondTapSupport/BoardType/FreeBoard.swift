//
//  ViewController3.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit

let item = ["1", "2", "3", "4", "5"]

class FreeBoard: UIViewController,YourCellDelegate{
    func didPressButton(_ tag: Int) {
        print("I have pressed a button with a tag: (tag)")
    }
    @IBOutlet var myTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        rightBarBtnGroup()
        self.myTableView.rowHeight = 240
        self.myTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0);
    }
    @IBAction func modalDismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    func makeCustomNavigationButton(imageName: String) -> UIBarButtonItem{
        let image = UIImage(named: imageName)!
        let btn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image, for: .normal)         // btn.addTarget(self, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtn = UIBarButtonItem(customView: btn)
        return barBtn
    }
    func rightBarBtnGroup(){
        let rightBarButton1 = self.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = self.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = self.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
}

extension FreeBoard: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "freecell", for: indexPath) as! FreeBoardTableViewCell
        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        //셀 구분선 처음부터 끝까지
        cell.separatorInset = UIEdgeInsets.zero
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10
        let maskLayer = CALayer()
//        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
