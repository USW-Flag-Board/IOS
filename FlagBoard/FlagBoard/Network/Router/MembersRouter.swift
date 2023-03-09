//
//  RegisterRouter.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/02.
//

import Foundation

import Alamofire

// 서버에서 Members에 해당하는 라우터
enum MembersRouter: URLRequestConvertible {
    
    // 내 상세정보 보기(서버 미구현)
    case withdrawal(password: String)
    
    var baseURL: URL {
        return URL(string: AlamofireManager.BASE_URL)!
    }


    var path: String {
        switch self {
        case .withdrawal:
            return "/members"
        }
    }


    var method: HTTPMethod {
        switch self {
        case .withdrawal:
            return .delete
        }
    }


        var parameters: Parameters {
            switch self {
            case let .withdrawal(password):
                var params = Parameters()
                params["currentPassword"] = password
                return params
          }
        }
        
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        
        return request
    }
}
