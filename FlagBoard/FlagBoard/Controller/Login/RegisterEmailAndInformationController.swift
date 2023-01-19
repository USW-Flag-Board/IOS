//
//  RegisterEmailAndInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

class RegisterEmailAndInformationController: UIViewController {
    
    var id: String?
    var password: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Functions
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        let emailVerifyStoryboard = UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard.instantiateViewController(withIdentifier: "EmailVerifyVC") as? EmailVerifyController else { return }

        self.navigationController?.pushViewController(emailVerifyViewController, animated: true)
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
