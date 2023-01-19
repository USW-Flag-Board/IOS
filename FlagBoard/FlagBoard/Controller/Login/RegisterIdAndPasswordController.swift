//
//  RegisterController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/14.
//

import UIKit

class RegisterIdAndPasswordController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reconfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let id = idTextField.text, idCheck(id: idTextField.text) else { return }
        guard let password = passwordTextField.text, passwordCheck(firstPassword: passwordTextField.text, secondPassword: reconfirmPassword.text) else { return }
        
        let registerEmailAndInformationStoryboard = UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard.instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC") as? RegisterEmailAndInformationController else { return }
        
        registerEmailAndInformationViewController.id = id
        registerEmailAndInformationViewController.password = password

        self.navigationController?.pushViewController(registerEmailAndInformationViewController, animated: true)
    }
    
    // MARK: Functions
    
    // 전체적인 id 체크를 관장하는 함수
    func idCheck(id: String?) -> Bool {
        guard let userId = id else { return false }
        
        if userId.isEmpty {
            print("아이디가 비어있음")
            return false
        } else if isValidId(id: userId){
            print("아이디 형식이 이상함")
            return false
        }
        return true
    }
    
    // 전체적인 password 체크를 관장하는 함수
    func passwordCheck(firstPassword: String?, secondPassword: String?) -> Bool {
        guard let userFirstPassword = firstPassword else { return false }
        guard let userSecondPassword = secondPassword else { return false }
        
        if userFirstPassword.isEmpty {
            print("첫번째 비밀번호가 비어있음")
            return false
        } else if userSecondPassword.isEmpty {
            print("두번째 비밀번호가 비어있음")
            return false
        } else if !isValidPassword(password: userFirstPassword) {
            print("비밀번호 자릿수가 이상함")
            return false
        } else if !confirmPassword(first: userFirstPassword, second: userSecondPassword) {
            print("비밀번호가 일치하지 않음")
            return false
        }
        return true
    }
    
    // 비밀번호 재확인
    func confirmPassword(first: String, second: String) -> Bool {
        
        if(first != second) {
            return false
        }
        return true
    }
    
    // id 형식 검사
    func isValidId(id: String?) -> Bool {
        let idRegEx = "^[0-9a-zA-Z]{6,12}$"
        
        let userId = NSPredicate(format:"SELF MATCHES %@", idRegEx)
                  return userId.evaluate(with: id)
    }
    
    // 비밀 번호 자릿수 검사 8~20
    func isValidPassword(password: String?) -> Bool {
        if let userPassword = password {
            if userPassword.count < 8 || userPassword.count > 20 {
                        return false
                    }
                }
        return true
    }
}
