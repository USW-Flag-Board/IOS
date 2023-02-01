//
//  AuthService.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/31.
//

import Foundation
import Combine

import Alamofire
import KeychainSwift

struct AuthService {
    
    let keyChain = KeychainSwift()
    
    func login(id: String, password: String) -> AnyPublisher<TokenData, AFError> {
        print("AuthService - login() called")

        return AlamofireManger.shared.session
            .request(AuthRouter.login(id: id, password: password))
            .publishDecodable(type: TokenData.self)
            .value()
            .map { receivedValue in
                
                keyChain.set(receivedValue.refreshToken, forKey: "refresh_token")
                keyChain.set(receivedValue.accessToken, forKey: "access_token")
                
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
//    static func reissueToken(accessToken: String, refreshToken: String) -> AnyPublisher<TokenData, AFError> {
//        print("AuthService - reissueToken")
//
//        return AlamofireManger.shared.session
//            .request(AuthRouter.reissueToken(accessToken: accessToken,
//                                             refreshToken: refreshToken))
//            .publishDecodable(type: TokenData.self)
//            .value()
//            .map { receivedValue in
//                // 받은 키체인에서 처리
//                return receivedValue
//            }.eraseToAnyPublisher()
//    }
}
