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
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor()
    ])
    
    let monitors = [MyLogger()] as [EventMonitor]
    
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}
