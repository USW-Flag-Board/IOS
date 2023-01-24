//
//  RegisterRouter.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/24.
//

import Foundation

import Alamofire

// check id and email, sign up, login, refresh token
enum AuthRouter: URLRequestConvertible {
    
    case checkId(id: String)
    case checkEmail(email: String)
    case sendAuthInfo(id: String, password: String, name: String, studentId: String,
                      email: String, major: String, joinType: String)
    case signUp(email: String, certification: String)
    case login(id: String, password: String)
    case tokenRefresh(accessToken: String, refreshToken: String)
    
    
    var baseURL: URL {
        return URL(string: API.BASE_URL)!
    }
    
    
    var endPoint: String {
        switch self {
        case .checkId:
            return "/api/auth/check/id"
        case .checkEmail:
            return "/api/auth/check/email"
        case .sendAuthInfo:
            return "/api/auth/join"
        case .signUp:
            return "/api/auth/sign-up"
        case .login:
            return "/api/auth/join"
        case .tokenRefresh:
            return "/api/auth/reissue"
        }
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .checkId:
            return .post
        case .checkEmail:
            return .post
        case .sendAuthInfo:
            return .post
        case .signUp:
            return .post
        case .login:
            return .post
        case .tokenRefresh:
            return .post
        }
    }
    
        
        var parameters: Parameters {
            switch self {
            case let .checkId(id):
                var params = Parameters()
                params["loginId"] = id
                return params
                
            case let .checkEmail(email):
                var params = Parameters()
                params["email"] = email
                return params
                
            case let .sendAuthInfo(id, password, name, studentId, email, major, joinType):
                var params = Parameters()
                params["loginId"] = id
                params["password"] = password
                params["name"] = name
                params["email"] = email
                params["studentId"] = studentId
                params["major"] = major
                params["joinType"] = joinType
                return params
                
            case let .signUp(email, certification):
                var params = Parameters()
                params["email"] = email
                params["certification"] = certification
                return params
                
            case let .login(id, password):
                var params = Parameters()
                params["loginId"] = id
                params["password"] = password
                return params
                
            case let .tokenRefresh(accessToken, refreshToken):
                var params = Parameters()
                params["accessToken"] = accessToken
                params["refreshToken"] = refreshToken
                return params
            }
        }
        
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        
        return request
    }
}
