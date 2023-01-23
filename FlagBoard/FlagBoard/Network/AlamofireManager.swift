//
//  AlamofireManager.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/23.
//

import Foundation

import Alamofire

final class AlamofireManger {
    
    static let shared = AlamofireManger()
    
    var session: Session
    
    private init() {
            session = Session()
    }
}
