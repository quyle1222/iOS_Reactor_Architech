//
//  AFNetwork.swift
//  Chat
//
//  Created by Tú Phạm on 08/02/2023.
//

import Alamofire

enum KeyENV:String {
    case BASE_URL = "http://192.168.120.238:8888/"
    
    var toString:String {
        return self.rawValue
    }
}

enum PathUrl: String {
    case LOGIN = "api/auth/login"
    case LIST_NEWS = "api/news/getList"
}

final class AFNetwork {
    var baseURL:String! = KeyENV.BASE_URL.rawValue
    
    func getAPI(url: PathUrl, paramester: Parameters? = nil) -> DataRequest {
        return AF.request(baseURL + url.rawValue,
                          method: .get,
                          parameters: paramester,
                          encoding: JSONEncoding.default)
    }
    
    func postAPI(url: PathUrl, paramester: Parameters? = nil) -> DataRequest {
        return AF.request(baseURL + url.rawValue,
                          method: .post,
                          parameters: paramester,
                          encoding: JSONEncoding.default)
    }
}
