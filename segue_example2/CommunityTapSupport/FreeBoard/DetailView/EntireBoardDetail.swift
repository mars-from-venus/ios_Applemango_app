//
//  EntireBoardDetail.swift
//  segue_example2
//
//  Created by mars on 2022/01/22.
//

import UIKit
import DLRadioButton
import SnapKit

class EntireBoardDetail: UIViewController, UITextFieldDelegate {

    private var textHeight = CGFloat(0)
    private var config: DataManager = DataManager.shared
    
    var boardInfo : BoardInfo?
    let detailView = BoardDetailView()
    private lazy var myTableView : UITableView = {
        let table = UITableView()
        
        return table
    }()
    private lazy var divider : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.borderColor)
        
        return view
    }()
    private lazy var inputBox : UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var fileImage : UIView = {
        let view = UIImageView()
        let image = #imageLiteral(resourceName: "picA")
        view.image = image
        
        return view
    }()
    private lazy var txtField : UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.appColor(.backGray)
        field.layer.cornerRadius = 10
        field.placeholder = "댓글을 입력해보세요"
        
        return field
    }()
    private lazy var registButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("등록", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.setTitleColor(UIColor.appColor(.shareGrayColor), for: .normal)
        btn.addTarget(self, action: #selector(registComment), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBarBtnGroup()
//        keyboardEvent()
//        self.mytable.dataSource = self
//        self.mytable.delegate = self
//        self.mytable.rowHeight = 101
//        self.mytable.layer.borderColor = UIColor.appColor(.backGray).cgColor
//        self.mytable.layer.borderWidth = 1
//        self.commentField.delegate = self
//        recommendBtn.isSelected = true
        addSubView()
        tableUtil()
        setConstraints()
        setDetailView()
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc private func registComment(){
        config.postComment(boardId: 0, postId: boardInfo!.id, contentHtml: txtField.text!)
        print("Comment Regist Success::")
    }
    private func tableUtil(){
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.separatorStyle = .none
        self.myTableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
    }
    private func addSubView(){
        self.view.addSubview(detailView)
        self.view.addSubview(myTableView)
        self.view.addSubview(inputBox)
        self.view.addSubview(divider)
        inputBox.addSubview(fileImage)
        inputBox.addSubview(txtField)
        inputBox.addSubview(registButton)
    }
    private func setConstraints(){
        detailView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        myTableView.snp.makeConstraints { make in
            make.top.equalTo(detailView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(inputBox.snp.top)
            make.width.equalToSuperview()
        }
        divider.snp.makeConstraints { make in
            make.bottom.equalTo(inputBox.snp.top)
            make.width.equalTo(inputBox)
            make.height.equalTo(1)
        }
        inputBox.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
        fileImage.snp.makeConstraints { make in
            make.leading.top.equalTo(inputBox).offset(15)
            make.width.equalTo(20)
        }
        txtField.snp.makeConstraints { make in
            make.top.equalTo(inputBox).offset(10)
            make.leading.equalTo(fileImage.snp.trailing).offset(10)
            make.height.equalTo(30)
        }
        registButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.leading.equalTo(txtField.snp.trailing).offset(5)
            make.top.equalTo(inputBox).offset(12)
            make.trailing.equalTo(inputBox).offset(-10)
        }
    }
    private func setDetailView(){
        let date = DateFormatter()
        date.dateFormat = "yy-MM-dd HH:mm"
        detailView.lblNick.text = boardInfo?.nickname
        detailView.lblCnt.text = "View \(String(describing: boardInfo!.view))"
        detailView.lblTime.text =  boardInfo!.createdDt
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//
//    @IBAction func asd(_ sender: UIButton){
//        print(sender)
//    }
//
    func rightBarBtnGroup(){
        let rightBarButton1 = navigationItem.makeCustomNavigationButton(imageName: "그룹 6")
        let rightBarButton2 = navigationItem.makeCustomNavigationButton(imageName: "그룹 5")
        let rightBarButton3 = navigationItem.makeCustomNavigationButton(imageName: "그룹 8")
        self.navigationItem.rightBarButtonItems = [rightBarButton1, rightBarButton2, rightBarButton3]
    }
//
//    func keyboardEvent(){
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWiiDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    @objc func keyboardWillAppear(_ notification: Notification){
//        //키보드 높이 가져오기
//        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keyboardRectangle.height
//        textHeight = keyboardHeight
//        self.view.frame.size.height -= keyboardHeight
//    }
//    @objc func keyboardWiiDisappear(_ notification: NSNotification){
//        self.view.frame.size.height += textHeight
//    }
    
//    @IBAction func kebabBtn(_ sender:UIButton){
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let friendBtn = UIAlertAction(title: "친구 신청", style: .default)
//        let chatBtn = UIAlertAction(title: "채팅 보내기", style: .default)
//        let banBtn = UIAlertAction(title: "게시물 신고", style: .destructive, handler: {(_) in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReportPage")
//            vc?.modalPresentationStyle = .fullScreen
//            self.present(vc!, animated: true)
//        })
//        let cancelBtn = UIAlertAction(title: "닫기", style: .cancel)
//        alert.addAction(friendBtn)
//        alert.addAction(chatBtn)
//        alert.addAction(banBtn)
//        alert.addAction(cancelBtn)
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    @IBAction func kebabBtn2(_ sender:UIButton){
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let friendBtn = UIAlertAction(title: "친구 신청", style: .default)
//        let chatBtn = UIAlertAction(title: "채팅 보내기", style: .default)
//        let banBtn = UIAlertAction(title: "댓글 신고", style: .destructive, handler: {(_) in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReportPage2")
//            vc?.modalPresentationStyle = .fullScreen
//            self.present(vc!, animated: true)
//        })
//        let cancelBtn = UIAlertAction(title: "닫기", style: .cancel)
//        alert.addAction(friendBtn)
//        alert.addAction(chatBtn)
//        alert.addAction(banBtn)
//        alert.addAction(cancelBtn)
//        self.present(alert, animated: true, completion: nil)
//    }
    
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
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        cell.selectionStyle = .none
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
