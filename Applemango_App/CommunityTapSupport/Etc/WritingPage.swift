//
//  WritingPage2.swift
//  segue_example2
//
//  Created by mars on 2022/04/02.
//

import UIKit
import DropDown

class WritingPage: UIViewController,UITextViewDelegate {
    
    lazy private var container : UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: self.view.safeAreaLayoutGuide.layoutFrame.height)
        
        return view
    }()
    
    lazy private var titleText : UITextField = {
        let txField = UITextField()
        txField.placeholder = "글 제목"
        txField.setPlaceholderColor(.lightGray)
        txField.font = UIFont(name:"Apple SD Gothic Neo", size: 15)
        
        return txField
    }()
    
    lazy private var boardButton : UIButton = {
        let button = UIButton()
        button.setTitle("게시판 선택", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "arrowIcon"), for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = .init(top: 0, left:container.frame.width * 0.7, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(makeDropDown), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var contentField : UITextView = {
        let txView = UITextView()
        txView.font = UIFont(name:"Apple SD Gothic Neo", size: 15)
        
        return txView
    }()
    lazy private var divider : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.borderColor)
        
        return view
    }()
    lazy private var divider2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.borderColor)
        
        return view
    }()
    
    var boardId : Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        maskView()
        autoLayout()
        naviTitleChange(name: "커뮤니티 글쓰기")
        addBarButton()
        placeholderSetting()
        textViewDidBeginEditing(contentField)
        textViewDidEndEditing(contentField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.appColor(.borderColor), width: 1)
    }
    
    func naviTitleChange(name:String){
         if let navigationBar = self.navigationController?.navigationBar {
             let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width, height: navigationBar.frame.height)
             let firstLabel = UILabel(frame: firstFrame)
             firstLabel.text = "\(name)"
             firstLabel.font = UIFont(name:"Apple SD Gothic Neo", size: 20)
             firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
             firstLabel.textAlignment = .center
             //이 페이지만 적용할땐 navigationItem 사용, 전체 네비에 적용할땐 navigationBar 사용
             self.navigationItem.titleView = firstLabel
         }
     }
    
    func addBarButton(){
        let rightBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(handlePosting))
        let leftBarButton = UIBarButtonItem(image:UIImage(named: "backIcon"), style:.plain , target:self, action: #selector(dismissModal))
        rightBarButton.tintColor = UIColor.appColor(.mainColor)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItems = [rightBarButton]
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true)
    }
    
    @objc func handlePosting(){
        DataManager.shared.postWriting(boardId:self.boardId,contentHtml: contentField.text!, title: titleText.text!)
        self.dismiss(animated: true)
    }
    
}

//AutoLayout
extension WritingPage {
    func addSubView(){
        self.view.addSubview(container)
        self.container.addSubview(titleText)
        self.container.addSubview(boardButton)
        self.container.addSubview(contentField)
        self.container.addSubview(divider)
        self.container.addSubview(divider2)
    }
    func maskView(){
        container.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
        boardButton.translatesAutoresizingMaskIntoConstraints = false
        contentField.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider2.translatesAutoresizingMaskIntoConstraints = false
    }
    func autoLayout(){
        container.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 5, left: 15, bottom: 5, right: 15))
        titleText.anchor(top: container.topAnchor, right: container.rightAnchor, bottom: nil, left: container.leftAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0),size: .init(width: container.frame.width, height:60 ))
        boardButton.anchor(top: divider.bottomAnchor, right: container.rightAnchor, bottom: nil, left: container.leftAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: container.frame.width, height: 70))
        contentField.anchor(top: divider2.bottomAnchor, right: container.rightAnchor, bottom:container.bottomAnchor, left: container.leftAnchor,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        divider.anchor(top: titleText.bottomAnchor, right: container.rightAnchor, bottom: nil, left: container.leftAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: container.frame.width, height: 1))
        divider2.anchor(top: boardButton.bottomAnchor, right: container.rightAnchor, bottom: nil, left: container.leftAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: container.frame.width, height: 1))
    }
}
//DropDown
extension WritingPage {
   @objc func makeDropDown(){
        let dropDown = DropDown()
        dropDown.dataSource = ["게시판 구분없이","인기게시물","자유게시판","유머게시판","질문/답변","차트분석"]
        dropDown.show()
        dropDown.anchorView = boardButton
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.textFont = UIFont.systemFont(ofSize: 15)
        dropDown.backgroundColor = .white
        dropDown.selectedTextColor = .white
        dropDown.selectionBackgroundColor = UIColor.appColor(.mainColor)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            switch item {
            case "게시판 구분없이":
                self.boardId = 1
            case "인기게시물":
                self.boardId = 2
            case "자유게시판":
                self.boardId = 3
            case "유머게시판":
                self.boardId = 4
            case "질문/답변":
                self.boardId = 5
            case "차트분석":
                self.boardId = 6
            default : self.boardId = 1
            }
            boardButton.setTitle(item, for: .normal)
        }
    }
}
//Text placeholder
extension WritingPage {
        func placeholderSetting() {
            contentField.delegate = self // txtvReview가 유저가 선언한 outlet
            contentField.text = "제가 바로 PlaceHolder입니다."
            contentField.textColor = UIColor.lightGray
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "내용작성"
                textView.textColor = UIColor.lightGray
            }
        }
}

