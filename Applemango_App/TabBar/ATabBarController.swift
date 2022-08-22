//
//  ATabBarController.swift
//  Applemango_App
//
//  Created by mars on 2022/08/15.
//

import UIKit

class ATabBarController: UITabBarController {
    private let vc1 = ExchangeTap()
    private let vc2 = CommunityTap()
    private let vc3 = NewsTap()
    private let vc4 = ChatTap()
    private let vc5 = MyTap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setNavi()
        self.view.backgroundColor = .white
    }
}

extension ATabBarController {
    private func setTitle() {
        vc1.tabBarItem.image = UIImage(named: "그룹 549")
        vc2.tabBarItem.image = UIImage(named: "그룹 551")
        vc3.tabBarItem.image = UIImage(named: "그룹 1")
        vc4.tabBarItem.image = UIImage(named: "그룹 582")
        vc5.tabBarItem.image = UIImage(named: "그룹 550")
        
        vc1.tabBarItem.title = "거래소"
        vc2.tabBarItem.title = "커뮤니티"
        vc3.tabBarItem.title = "블록체인"
        vc4.tabBarItem.title = "채팅"
        vc5.tabBarItem.title = "마이"
    }
    
    private func setNavi() {
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        setViewControllers([nav1,nav2,nav3,nav4,nav5], animated: false)
    }
}
