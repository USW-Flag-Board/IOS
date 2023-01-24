//
//  EmailVerifyController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire

class EmailVerifyController: UIViewController {

    @IBOutlet weak var authNumTextField: UITextField!
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: @IBAction Functions
    @IBAction func AuthenticateButtonPressed(_ sender: UIButton) {
        guard let certification = authNumTextField.text, !certification.isEmpty else {
            print("인증번호가 비어있습니다")
            return }
        
        signUp(email: email!, certification: certification)
    }
    
    // MARK: Functions
    private func signUp(email: String, certification: String) {
        
        AlamofireManger
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
