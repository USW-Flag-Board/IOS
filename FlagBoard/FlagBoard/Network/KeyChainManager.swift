//
//  KeyChainManger.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/01.
//

import Foundation
import Alamofire

class KeyChainManager {
    
    static let shared: KeyChainManager = {
        return KeyChainManager()
    }()
    
    // 토큰 저장하기
    func setData (service: String, account: String, value: String) {
        print("KeyChainManager - setData() called")
        
        // 쿼리 생성
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
        ]
    
        // 중복 제거 후 저장
        SecItemDelete(keyChainQuery)
        
        // 에러 처리
        let status = SecItemAdd(keyChainQuery, nil)
        if status != errSecSuccess {
                // Print out the error
                print("setToken error: \(status)")
            }
    }
    
    func getData(_ service: String, account: String) -> String? {
        print("KeyChainManager - getData() called")
        
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        if status != errSecSuccess {
                // Print out the error
                print("getData error: \(status)")
                return nil
            }
        
        let retrievedData = dataTypeRef as! Data
        let value = String(data: retrievedData, encoding: String.Encoding.utf8)
        
        return value
    }
    
    func delete(_ service: String, account: String) {
        print("KeyChainManager - delete() called")
        
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]
        
        let status = SecItemDelete(keyChainQuery)
        if status != errSecSuccess {
                // Print out the error
                print("deleteData error: \(status)")
            }
    }
    
    func getAthorizationHeader(serviceId: String) -> HTTPHeaders? {
        if let accessToken = self.getData(serviceId, account: "accessToken") {
            return ["Authorization" : "bearer \(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
    
}
