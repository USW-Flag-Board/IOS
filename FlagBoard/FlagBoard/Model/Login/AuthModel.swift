//
//  AuthModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/31.
//

import Foundation

struct AuthModel {
    
    // MARK: - id and email overlab check data
    struct OverlabCheckData: Codable {
        let message: String
        let payload: Bool
        let status: String
    }
}



