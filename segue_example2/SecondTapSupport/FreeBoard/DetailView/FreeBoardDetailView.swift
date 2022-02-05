//
//  BoardDetailViewViewController.swift
//  segue_example2
//
//  Created by mars on 2022/01/20.
//

import UIKit

class FreeBoardDetailView: UIViewController, YourCellDelegate4 {
    func didPressButton(_ tag: Int) {
        print("123")
    }
    
    @IBOutlet weak var myTableView : UITableView!
    @IBOutlet weak var boardView : UIView!
    @IBOutlet weak var shareBtn : UIButton!
    @IBOutlet weak var commentBtn : UIButton!
    @IBOutlet weak var dividerView : UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        rightBarBtnGroup()
        self.boardView.layer.borderWidth = 1
        self.boardView.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.dividerView.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.dividerView.layer.borderWidth = 1
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.rowHeight = 101
        self.myTableView.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.myTableView.layer.borderWidth = 1
    }

    func makeCustomNavigationButton(imageName: String) -> UIBarButtonItem{
        let image = UIImage(named: imageName)!
        let btn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image, for: .normal)     //     btn.addTarget(self, action: action, for: .touchUpInside)
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
    
    @IBAction func kebabBtn(_ sender:UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let friendBtn = UIAlertAction(title: "친구 신청", style: .default)
        let chatBtn = UIAlertAction(title: "채팅 보내기", style: .default)
        let banBtn = UIAlertAction(title: "게시물 신고", style: .destructive, handler: {(_) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReportPage")
            vc?.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
        })
        let cancelBtn = UIAlertAction(title: "닫기", style: .cancel)
        alert.addAction(friendBtn)
        alert.addAction(chatBtn)
        alert.addAction(banBtn)
        alert.addAction(cancelBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func kebabBtn2(_ sender:UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let friendBtn = UIAlertAction(title: "친구 신청", style: .default)
        let chatBtn = UIAlertAction(title: "채팅 보내기", style: .default)
        let banBtn = UIAlertAction(title: "댓글 신고", style: .destructive, handler: {(_) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReportPage2")
            vc?.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
        })
        let cancelBtn = UIAlertAction(title: "닫기", style: .cancel)
        alert.addAction(friendBtn)
        alert.addAction(chatBtn)
        alert.addAction(banBtn)
        alert.addAction(cancelBtn)
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FreeBoardDetailView: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! FreeCommentCell
        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }
}
