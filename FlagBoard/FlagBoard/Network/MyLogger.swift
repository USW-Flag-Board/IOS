//
//  ApiLogger.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/24.
//

import Foundation

import Alamofire

final class MyLogger: EventMonitor {
    let queue = DispatchQueue(label: "FlagBoard_MyLogger")
    
    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
        print("ApiLogger - Resuming: \(request)")
    }
    
    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("ApiLogger - Finished: \(response)")
    }
}
