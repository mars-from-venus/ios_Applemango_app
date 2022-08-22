//
//  Constant.swift
//  segue_example2
//
//  Created by mars on 2022/03/01.
//

import Foundation
import Alamofire

struct Api {
    static let baseUrl = "http://13.124.24.182:8080"
}

struct DataManager {
    
    static let shared = DataManager()

    func getBoardList(boardId : Int, completion: @escaping((BoardList) -> Void)){
        let url = Api.baseUrl + "/api/board/\(boardId)"
        let network = AF.request(url)
        network.responseDecodable(of: BoardList.self){
            response in
            guard let board = response.value else { return print("BOARD ERROR") }
            completion(board)
        }
    }
    
    func postWriting(boardId:Int,contentHtml:String, title:String) {
        let url = Api.baseUrl + "/api/board/\(boardId)/post"
        let param : Parameters = [
            "contentHtml": contentHtml,
            "title": title,
        ]
         let header : HTTPHeaders = ["Content-Type": "application/json"]
         let dataRequest = AF.request(url, method: .post, parameters: param ,encoding: JSONEncoding.default, headers: header)
        dataRequest.responseDecodable(of:BoardDataModel.self){ response in
             switch response.result {
             case .success :
                 print("SUCCESS")
             case .failure :
                 print("ERROR")
             }
         }
    }
    
    func postComment(boardId:Int,postId:Int,contentHtml:String) {
        let url = Api.baseUrl + "/api/board/\(boardId)/post/\(postId)"
        let param : Parameters = [
            "contentHtml": contentHtml,
        ]
         let header : HTTPHeaders = ["Content-Type": "application/json"]
         let dataRequest = AF.request(url, method: .post, parameters: param ,encoding: JSONEncoding.default, headers: header)
        dataRequest.responseDecodable(of:BoardCommentModel.self){ response in
             switch response.result {
             case .success :
                 print("SUCCESS")
             case .failure :
                 print("ERROR")
             }
         }
    }
    
//
//    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//
//        switch statusCode {
//
//        case 200: return isValidData(data:data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//
//    private func isValidData(data:Data) -> NetworkResult<Any>{
//        let decoder = JSONDecoder()
//
//        guard let decodeData = try? decoder.decode(BoardList.self, from: data) else {return .pathErr}
//
//        return .success(decodeData.data)
//    }
    
  public func loginTest(){
        let url = Api.baseUrl + "/api/login-test"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(url, method: .post ,encoding: JSONEncoding.default, headers: header).responseDecodable(of:LoginInfo.self){
            (response) in
            switch response.result {
            case .success :
                print("login")
//                print(response)
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}

extension Encodable {
    var toDict : [String: Any]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String:Any] else { return nil }
        return dictionary
    }
}
