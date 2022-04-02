//
//  DataModel.swift
//  segue_example2
//
//  Created by mars on 2022/03/01.
//

import Foundation
import Alamofire

struct BoardDataModel : Codable {
    let title : String
    let contentHtml : String
}

struct LoginInfo : Codable {
    let userId : Int
    let kakaoId : Int
    let status : String
    let email : String
    let birthday : Int
    let gender : String
    let name : String
    let nickname : String
    let loginDt : String
    let createdDt : String
    let updatedDt : String
}

struct BoardList : Decodable {
    let pageNo : Int?
    let totalCount : Int?
    let posts : [BoardInfo]?
}

struct BoardInfo : Decodable {
    let createdDt : String
    let dislike : Int
    let fileYn : Bool
    let id : Int
    let like : Int
    let nickname : String
    let noticeYn : Bool
    let reply : Int
    let seqNo : Int
    let title : String
    let view : Int
    
}
