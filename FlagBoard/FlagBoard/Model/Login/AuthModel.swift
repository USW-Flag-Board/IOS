//
//  AuthModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/31.
//

import Foundation

// MARK: - Token Data
struct TokenData: Codable {
    let accessToken: String
    let accessTokenExpiresIn: Int
    let grantType: String
    let refreshToken: String
}
