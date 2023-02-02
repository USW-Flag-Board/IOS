//
//  OAuthCredential.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/01.
//

import Foundation

import Alamofire

struct OAuthCredential: AuthenticationCredential {
    let accessToken: String
    let refreshToken: String
    let expiration: Date
    
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 30) > expiration }
}
