//
//  RegisterModel.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/20.
//

import Foundation

// 사용자 등록 모델
struct RegisterModel {
    
    struct Majors {
        static let data = ["국어국문", "사학", "영어영문학", "프랑스어문학", "러시아어문학", "일어일문",
                      "중어중문", "법", "행정", "미디어커뮤니케이션",
                      
                      // 경상대학
                      "경영", "글로벌비지니스", "회계", "경제금융", "국제개발협력", "호텔경영", "외식경영", "관광경영",

                      // 공과대학
                      "바이오사이언스", "바이오공학마케팅", "융합화학산업", "건설환경공학", "환경에너지공학", "건축",
                      "도시부동산","산업공학", "기계공학", "전자재료공학", "전자물리", "전기공학", "전자공학",
                      "신소재공학", "화학공학",

                      // ICT대학
                      "컴퓨터SW", "미디어SW", "정보통신", "정보보호", "데이터과학", "클라우드융복합",

                      // 건강과학대학
                      "간호", "아동가족복지", "의류", "식품영양", "스포츠과학",

                      // 미술대학
                      "회화", "조소", "커뮤니케이션디자인", "패션디자인", "공예디자인",

                      // 음악대학
                      "작곡", "성악", "피아노", "관현악", "국악",

                      // 융합문화예술대학
                      "영화영상", "연극", "무용", "문화컨텐츠테크놀로지",

                      // 국제대학
                      "자유전공"]
    }

    
    // 아이디 형식 검사
    static func isValidId(id: String?) -> Bool {
        let idRegEx = "^[0-9a-zA-Z]{6,12}$"
        
        let userId = NSPredicate(format:"SELF MATCHES %@", idRegEx)
                  return userId.evaluate(with: id)
    }
    
    // 비밀 번호 자릿수 검사 8~20
    static func isValidPassword(password: String?) -> Bool {
        if let userPassword = password {
            if userPassword.count < 8 || userPassword.count > 20 {
                        return false
                    }
                }
        return true
    }
    
    // 비밀번호 재확인
    static func confirmPassword(first: String, second: String) -> Bool {
        
        if(first != second) {
            return false
        }
        return true
    }
    
    // 이메일 형식 검사
    static func isValidEmail(email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let userEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                  return userEmail.evaluate(with: email)
    }
    
    // 이름 형식 검사
    static func isValidName(name: String?) -> Bool {
        let nameRegEx = "[가-힣]{2,5}"
        
        let userName = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
                  return userName.evaluate(with: name)
    }
    
    // 학번 형식 검사
    static func isValidStudentId(studentId: String?) -> Bool {
        let studentIdRegEx = "[0-9]{8}"
        
        let userStudentId = NSPredicate(format:"SELF MATCHES %@", studentIdRegEx)
                  return userStudentId.evaluate(with: studentId)
    }
}

