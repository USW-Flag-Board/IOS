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
    
    // 현재사용자 프로필가져오기 example
    
//    static func fetchCurrentUserInfo() -> AnyPublisher<UserData, AFError>{
//        print("AuthApiService - fetchCurrentUserInfo() called")
//
//
//        let storedTokenData = UserDefaultsManager.shared.getTokens()
//
//        let credential = OAuthCredential(accessToken: storedTokenData.accessToken,
//                                         refreshToken: storedTokenData.refreshToken,
//                                         expiration: Date(timeIntervalSinceNow: 60 * 60))
//
//        // Create the interceptor
//        let authenticator = OAuthAuthenticator()
//        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator,
//                                                        credential: credential)
//
//        return ApiClient.shared.session
//            .request(UserRouter.fetchCurrentUserInfo, interceptor: authInterceptor)
//            .publishDecodable(type: UserInfoResponse.self)
//            .value()
//            .map{ receivedValue in
//                return receivedValue.user
//            }.eraseToAnyPublisher()
//    }
}
