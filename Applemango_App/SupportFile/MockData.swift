//
//  MockData.swift
//  segue_example2
//
//  Created by hs on 2022/02/09.
//

import Foundation

struct MockData {
    static let tableTitle:Array<String> = ["NFT 관련 사이트 정리","[초보필독] 초보분들을 위한 코인 용어 정리","이더리움, 비트코인과 무엇이 다른가","위믹스 자체코인 매각해서 선데이토즈 인수 계획","솔라나 9시 업비트 상장 계획","나스닥 상장사 비트코인 영향력 엄청 나","애플망고, 코인판 3개월만에 앞 질러","공지사항을 써봅니다"]
    static let exchageTitle:Array<String> = ["업비트", "바이낸스", "빗썸","코인원","코빗","파이넥스" ]
    static let exchagePrice:Array<Int> = [60560000,60360000,60200000,60130000,60180000,60412000]
    static let myList:Array<String> = ["게시물 내역","댓글 내역","관심 게시물","친구 목록"]
}


struct MockButtonModel {
    private var buttonTitle: String?
    
    init(_ title: String) {
        self.buttonTitle = title
    }
    
    var title: String {
        return buttonTitle!
    }
}

enum NewsButtonType: String {
    case one = "코인 뉴스"
    case two = "개발/채굴"
    case three = "코인정보"
    case four = "꿀팁"
}

enum CommunityButtonType: String {
    case one = "인기게시물"
    case two = "자유게시판"
    case three = "유머게시판"
    case four = "질문/답변"
    case five = "차트분석"
}

struct MockButton {
    static func getDataSource() -> [MockButtonModel] {
        return [MockButtonModel(NewsButtonType.one.rawValue),
                MockButtonModel(NewsButtonType.two.rawValue),
                MockButtonModel(NewsButtonType.three.rawValue),
                MockButtonModel(NewsButtonType.four.rawValue),
        ]
    }
    static func getCoDataSource() -> [MockButtonModel] {
        return [MockButtonModel(CommunityButtonType.one.rawValue),
                MockButtonModel(CommunityButtonType.two.rawValue),
                MockButtonModel(CommunityButtonType.three.rawValue),
                MockButtonModel(CommunityButtonType.four.rawValue),
                MockButtonModel(CommunityButtonType.five.rawValue)
        ]
    }
}


