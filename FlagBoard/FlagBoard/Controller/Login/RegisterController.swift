//
//  RegisterController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/14.
//

import UIKit

class RegisterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: Functions
    
    // id 형식 검사(형식은 미정)
    func isValidId(id: String?) -> Bool {
        let idRegEx = ""
        
        let userId = NSPredicate(format:"SELF MATCHES %@", idRegEx)
                  return userId.evaluate(with: id)
    }
    
    // 비밀 번호 자릿수 검사
    func isValidPassword(password: String?) -> Bool {
        if let userPassword = password {
                    if userPassword.count < 8 {
                        return false
                    }
                }
        return true
    }
    
    // 이메일 형식 검사
    func isValidEmail(email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let userEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                  return userEmail.evaluate(with: email)
    }
    
    // 이름 형식 검사
    func isValidName(name: String?) -> Bool {
        let nameRegEx = "[가-힣]{3, 4}"
        
        let userName = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
                  return userName.evaluate(with: name)
    }
    
    // 학번 형식 검사
    func isValidStudentId(studentId: String?) -> Bool {
        let studentIdRegEx = "0-9{8}"
        
        let userStudentId = NSPredicate(format:"SELF MATCHES %@", studentIdRegEx)
                  return userStudentId.evaluate(with: studentId)
    }

}
