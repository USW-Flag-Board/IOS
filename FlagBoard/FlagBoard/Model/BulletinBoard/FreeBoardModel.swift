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
    static var sampleData0 = [
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "공지게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3)
    ]
    static var sampleData1 = [
        DummyData(title: "정보게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
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
    static var sampleData2 = [
        DummyData(title: "자유게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
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
    static var sampleData3 = [
        DummyData(title: "동아리 이모저모 게시판입니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
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
    static var sampleData4 = [
        DummyData(title: "Activity.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
        DummyData(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3),
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
