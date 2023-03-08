//
//  EmailVerifyController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire

class EmailVerifyController: UIViewController {

    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var authNumTextField: UITextField!
    
    var id: String?
    var password: String?
    var joinType: String?
    var name: String?
    var nickName: String?
    var major: String?
    var studentId: String?
    var phoneNumber: String?
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyles()
        print(id, password, joinType, name, nickName, major, studentId, phoneNumber)
    }
    
    // MARK: @IBAction Functions
    @IBAction func AuthenticateButtonPressed(_ sender: UIButton) {
        guard let certification = authNumTextField.text, !certification.isEmpty else {
            print("인증번호가 비어있습니다")
            return }
        
        if let email = self.email {
            signUp(email: email, certification: certification)
        }
    }
    
    // MARK: Functions
    func setStyles() {
        let addressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        addressLabel.text = "@suwon.ac.kr"
        emailIdTextField.rightView = addressLabel
        emailIdTextField.rightViewMode = .always
    }
    
    private func signUp(email: String, certification: String) {
        
        AlamofireManager
                    .shared
                    .session
                    .request(AuthRouter.signUp(email: email, certification: certification))
                    .response { response in
                    guard let statusCode = response.response?.statusCode else { return }
                    
                    switch statusCode {
                    case 200:
                        print("회원가입 성공")
                    case 404:
                        print("존재하지 않는 가입정보입니다.")
                    case 409:
                        print("인증번호가 일치하지 않습니다.")
                    default:
                        print("other code ->", statusCode)
                    }
        }
    }
}
