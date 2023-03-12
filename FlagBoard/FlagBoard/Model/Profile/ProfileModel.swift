//
//  ProfileModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/10/07.
//

import Foundation

// MARK: - ProfileData
struct ProfileData: Codable {
    let message: String
    let payload: profilePayload
    let status: String
}

// MARK: - Payload
struct profilePayload: Codable {
    let bio, email, major, name: String
    let nickName, phoneNumber, profileImg, studentID: String

    enum CodingKeys: String, CodingKey {
        case bio, email, major, name, nickName, phoneNumber, profileImg
        case studentID = "studentId"
    }
}
