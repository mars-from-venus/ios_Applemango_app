//
//  EntireBoardDetail.swift
//  segue_example2
//
//  Created by mars on 2022/01/22.
//

import UIKit
import DLRadioButton

class EntireBoardDetail: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var boardView : UIView!
    @IBOutlet weak var mytable : UITableView!
    @IBOutlet weak var registBtn : UIButton!
    @IBOutlet weak var recommendBtn : UIButton!
    @IBOutlet weak var dividerView : UIView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var commentView : UIView!
    @IBOutlet weak var commentField : UITextField!

    private var textHeight = CGFloat(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        rightBarBtnGroup()
        keyboardEvent()
        self.boardView.layer.borderWidth = 1
        self.boardView.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.dividerView.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.dividerView.layer.borderWidth = 1
        self.mytable.dataSource = self
        self.mytable.delegate = self
        self.mytable.rowHeight = 101
        self.mytable.layer.borderColor = UIColor.appColor(.backGray).cgColor
        self.mytable.layer.borderWidth = 1
        self.commentField.delegate = self
        lblType.layer.borderWidth = 1
        lblType.layer.borderColor = UIColor.appColor(.borderColor).cgColor
        lblType.layer.cornerRadius = 5
        recommendBtn.isSelected = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func asd(_ sender: UIButton){
        print(sender)
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
    
    func keyboardEvent(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWiiDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillAppear(_ notification: Notification){
        //키보드 높이 가져오기
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        textHeight = keyboardHeight
        self.view.frame.size.height -= keyboardHeight
    }
    @objc func keyboardWiiDisappear(_ notification: NSNotification){
        self.view.frame.size.height += textHeight
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

extension EntireBoardDetail: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! EntireDetailCell
//        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }

}

//extension EntireBoardDetail {
//    private func setupGestureRecognizer() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        self.view.addGestureRecognizer(tap)
//
//    }
//    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//    }
//    private func registerForKeyboardNotifications() {
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    private func unregisterForKeyboardNotifications() {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    @objc func keyboardWillShow(_ notificatoin: Notification) {
//        let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let keyboardSize = (notificatoin.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let height = keyboardSize.height - view.safeAreaInsets.bottom /* 애니메이션 처리 */
//    }
//    @objc func keyboardWillHide(_ notificatoin: Notification) {
//        let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt /* 애니메이션 처리 */
//    }
//}
