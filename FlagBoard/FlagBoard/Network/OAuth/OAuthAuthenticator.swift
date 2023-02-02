//
//  OAuthAuthenticator.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/01.
//

import Foundation

import Alamofire
import KeychainSwift

class OAuthAuthenticator: Authenticator {

    let keyChain = KeychainSwift()

    // 헤더에 인증 추가
    func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
        print("OAuthAuthenticator - apply called")
        // custom header example
        // urlRequest.setValue(credential.accessToken, forHTTPHeaderField: "Authorization")
    }

    // token refresh
    func refresh(_ credential: OAuthCredential,
                 for session: Session,
                 completion: @escaping (Result<OAuthCredential, Error>) -> Void) {

        print("OAuthAuthenticator - 토큰 리프레시 요청")

        guard let accessToken = keyChain.get("access_token") else { return }
        guard let refreshToken = keyChain.get("refresh_token") else { return }

        let request = session.request(AuthRouter.reissueToken(accessToken: accessToken,
                                                              refreshToken: refreshToken))

        request.responseDecodable(of: TokenData.self) { [self] result in
            switch result.result {
            case .success(let value):

                // 재발행 받은 토큰 키체인에 저장
                self.keyChain.set(value.accessToken, forKey: "access_token")
                self.keyChain.set(value.refreshToken, forKey: "refresh_token")

                let expiration = Date(timeIntervalSinceNow:
                                        TimeInterval(value.accessTokenExpiresIn))

                // 새로운 Credential 생성
                let newCredential = OAuthCredential(accessToken: value.accessToken,
                                                    refreshToken: value.refreshToken,
                                                    expiration: expiration)

                completion(.success(newCredential))

            case .failure(let error):
                completion(.failure(error))
            }
        }

    }

    func didRequest(_ urlRequest: URLRequest,
                    with response: HTTPURLResponse,
                    failDueToAuthenticationError error: Error) -> Bool {
        print("OAuthAuthenticator - didRequest() called")
       
        // 서버에서 401이 떨어지면 refresh
        return response.statusCode == 401
    }

    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential)
    -> Bool {
        print("OAuthAuthenticator - isRequest() called")
        // If authentication server CANNOT invalidate credentials, return `true`
        return true
    }
}
