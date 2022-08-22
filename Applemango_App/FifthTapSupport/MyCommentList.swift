//
//  MyCommentList.swift
//  Applemango_App
//
//  Created by mars on 2022/05/25.
//

import UIKit
import SnapKit

class MyCommentList: UIViewController {
    
    lazy var stackView : UIStackView = {
        let view = UIStackView(arrangedSubviews: [columnLabel(title: "총 댓글 수", sub:"152"),columnLabel(title: "총 답글 수", sub:"121"),columnLabel(title: "받은 좋아요 수", sub:"187")])
        
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 8
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        stackLayout()
    }
    
    private func stackLayout(){
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func columnLabel(title:String,sub:String) -> UIStackView{
        let titles = UILabel()
        let subTitle = UILabel()
        let container = UIStackView(arrangedSubviews: [titles,subTitle])
        
        container.axis = .vertical
        container.distribution = .equalCentering
        
        titles.text = title
        subTitle.text = sub
        
        container.addSubview(titles)
        container.addSubview(subTitle)
        
        titles.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
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
