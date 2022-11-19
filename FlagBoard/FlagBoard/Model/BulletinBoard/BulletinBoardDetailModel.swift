//
//  BulletinBoardDetailModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/11/19.
//

import Foundation

struct CommentData{

    let contents: String
    let author: String
    let createAt: String
    
    init(contents: String, author: String, createAt: String){
        self.contents = contents
        self.author = author
        self.createAt = createAt
    }
}

#if DEBUG
extension CommentData{
    static var sampleData = [
       CommentData(contents: "좋은 글 감사합니다 ^^", author: "정충일", createAt: "2022.08.04 22:11"),
       CommentData(contents: "퍼가요 ^^", author: "박명범", createAt: "2022.08.04 23:33"),
       CommentData(contents: "꿀팁이네요 ㅎㅎ", author: "강지은", createAt: "2022.08.04 23:53"),
    ]
    
}

#endif
