//
//  LoginModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/03.
//

import Foundation

// MARK: - TokenData
struct TokenData: Codable {
    let message: String
    let payload: Payload
    let status: String
}

// MARK: - Payload
struct Payload: Codable {
    let accessToken: String
    let accessTokenExpiresIn: Int
    let grantType, refreshToken: String
}
