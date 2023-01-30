//
//  RegisterController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/14.
//

import UIKit

import Alamofire


class RegisterIdAndPasswordController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reconfirmPassword: UITextField!
    
    var id: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let id = idTextField.text, idCheck(id: id) else { return }
        guard let password = passwordTextField.text,
              passwordCheck(firstPassword: password,
                            secondPassword: reconfirmPassword.text) else { return }
    
        // 전역 변수에 넣기
        self.id = id
        self.password = password
        
        // 위 조건들을 통과할 경우 id 확인
        IdOverlap(id: self.id)
    }
    
    
    // MARK: Functions
    func idCheck(id: String?) -> Bool { // id 체크를 관장하는 함수
        guard let userId = id else { return false }
        
        switch userId {
        case let id where id.isEmpty:
            print("아이디가 비어있음")
            return false
        case let id where !RegisterModel.isValidId(id: id):
            print("아이디의 형식이 이상함")
            return false
        default:
            return true
        }
    }
    
    
    // password 체크를 관장하는 함수
    func passwordCheck(firstPassword: String?, secondPassword: String?) -> Bool {
        guard let userFirstPassword = firstPassword else { return false }
        guard let userSecondPassword = secondPassword else { return false }
        
        switch (userFirstPassword, userSecondPassword) {
        case let (firstPassword, _) where firstPassword.isEmpty:
            print("첫번째 비밀번호가 비어있음")
            return false
        case let (_, secondPassword) where secondPassword.isEmpty:
            print("두번째 비밀번호가 비어있음")
            return false
        case let (firstPassword, _) where !RegisterModel.isValidPassword(password: firstPassword):
            print("비밀번호 자릿수가 이상함")
            return false
        case let (firstPassword, secondPassword)
            where !RegisterModel.confirmPassword(first: firstPassword, second: secondPassword):
            print("비밀번호가 일치하지 않음")
            return false
        default:
            return true
        }
    }
    
    func IdOverlap(id: String) {
        AlamofireManger.shared.session.request(AuthRouter.checkId(id: id)).response { response in
            guard let statusCode = response.response?.statusCode else { return }
            
            switch statusCode {
            case 200:
                print("사용 가능한 아이디입니다.")
                self.pushToNextVC(id: self.id, password: self.password)
            case 409:
                print("이미 사용 중인 아이디입니다.")
            default:
                print("other code ->", statusCode)
            }
        }
    }
    
    func pushToNextVC(id: String, password: String) {
        // 다음 화면으로 전환
        let registerEmailAndInformationStoryboard = UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard.instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC") as? RegisterEmailAndInformationController else { return }

        registerEmailAndInformationViewController.id = id
        registerEmailAndInformationViewController.password = password

        self.navigationController?.pushViewController(registerEmailAndInformationViewController, animated: true)
    }
}
