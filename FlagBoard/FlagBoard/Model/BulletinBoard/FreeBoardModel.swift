//
//  FreeBoardModel.swift
//  FlagBoard
//
//  Created by 송지연 on 2022/11/01.
//

import Foundation

struct DummyData{

    let title: String
    let writer: String
    let date: String
    let seenNum: Int
    let commentNum: Int
    
    init(title: String, writer: String, date: String, seenNum: Int, commentNum: Int){
        self.title = title
        self.writer = writer
        self.date = date
        self.seenNum = seenNum
        self.commentNum = commentNum
    }
}

#if DEBUG
extension DummyData{
    static var sampleData = [
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3)
    ]
}

#endif
