//
//  RegisterRouter.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/01.
//

import Foundation

import Alamofire

// 현재 로그인한 사용자 정보 가져오기
enum UserRouter: URLRequestConvertible {
    
    // 내 상세정보 보기(서버 미구현)
    case getMyProfile
    
    var baseURL: URL {
        return URL(string: AlamofireManager.BASE_URL)!
    }


    var path: String {
        switch self {
        case .getMyProfile:
            return "/auth/check/id"
        }
    }


    var method: HTTPMethod {
        switch self {
        case .getMyProfile:
            return .get
        }
    }


//        var parameters: Parameters {
//            switch self {
//            case let .getMyProfile:
//                var params = Parameters()
//                params["loginId"] = id
//                return params
//          }
//        }
        
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request).httpBody
        
        return request
    }
}
