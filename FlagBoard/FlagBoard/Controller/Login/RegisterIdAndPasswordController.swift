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
    
    let baseUrl = "http://3.39.36.239:8080"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let id = idTextField.text, idCheck(id: id) else { return }
        guard let password = passwordTextField.text,
              passwordCheck(firstPassword: password, secondPassword: reconfirmPassword.text) else { return }
        
        // 위 조건들을 통과할 경우 id 확인
        IdOverlap(id: id)
    }
    
    // MARK: Functions
    
    // id 체크를 관장하는 함수
    func idCheck(id: String?) -> Bool {
        guard let userId = id else { return false }
        
        if userId.isEmpty {
            print("아이디가 비어있음")
            return false
        } else if !RegisterModel.isValidId(id: userId) {
            print("아이디 형식이 이상함")
            return false
        }
        
        return true
    }
    
    // password 체크를 관장하는 함수
    func passwordCheck(firstPassword: String?, secondPassword: String?) -> Bool {
        guard let userFirstPassword = firstPassword else { return false }
        guard let userSecondPassword = secondPassword else { return false }
        
        if userFirstPassword.isEmpty {
            print("첫번째 비밀번호가 비어있음")
            return false
        } else if userSecondPassword.isEmpty {
            print("두번째 비밀번호가 비어있음")
            return false
        } else if !RegisterModel.isValidPassword(password: userFirstPassword) {
            print("비밀번호 자릿수가 이상함")
            return false
        } else if !RegisterModel.confirmPassword(first: userFirstPassword, second: userSecondPassword) {
            print("비밀번호가 일치하지 않음")
            return false
        }
        return true
    }
    
    func IdOverlap(id: String) {
        let url = baseUrl + "/api/auth/"
        let parameter: Parameters = [
            "id" : id
        ]
        
        AF.request(url, method: .get,
                   parameters: parameter,
                   encoding: URLEncoding.default).response { response in
            if response.response?.statusCode == 200 {
                
                //print("status code ->", response.response?.statusCode)
                self.pushToNextVC()
                
            } else {
                print("아이디 중복으로 인한 실패!")
            }
            
            
            
        }
    }
    
    func pushToNextVC() {
        // 다음 화면으로 전환
        let registerEmailAndInformationStoryboard = UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard.instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC") as? RegisterEmailAndInformationController else { return }

        registerEmailAndInformationViewController.id = self.idTextField.text
        registerEmailAndInformationViewController.password = self.passwordTextField.text

        self.navigationController?.pushViewController(registerEmailAndInformationViewController, animated: true)
    }
}
