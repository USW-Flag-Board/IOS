//
//  RegisterEmailAndInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire


class RegisterEmailAndInformationController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var studentIdTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var id: String?
    var password: String?
    
    let baseUrl = "http://3.39.36.239:8080"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        self.majorTextField.inputView = majorPicker
        
        print(id!, password!)
    }
    
    // MARK: @IBAction Functions
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, nameCheck(name: name) else { return }
        guard let studentId = studentIdTextField.text, studentIdCheck(studentId: studentId) else { return }
        guard let major = majorTextField.text, !major.isEmpty else {
            print("전공이 비었습니다!")
            return }
        guard let type = typeTextField.text, !type.isEmpty else { return }
        guard let email = emailTextField.text, emailCheck(email: email) else { return }
        
        // 위 모든 검사를 통과하면 중복 체크
        emailOverlap(name: name, studentId: studentId, major: major, type: type, email: email)
    }
    
    
    // MARK: Functions
    private func emailOverlap(name: String, studentId: String, major: String, type: String, email:String) {
        var url = baseUrl + "/api/auth/"
        url += email + "@suwon.ac.kr"
        
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.default).response { response in

            if response.response?.statusCode == 200 {
                
                // 이메일이 중복되지않으면 서버에 유저 정보 전송
                self.sendUserInfo(name: name, studentId: studentId, major: major, type: type, email: email + "@suwon.ac.kr")
                
            } else {
                print("이메일 중복으로 인한 실패!")
            }
        }
        
    }
    
    private func sendUserInfo(name: String, studentId: String, major: String, type: String, email:String) {
        let url = baseUrl + "/api/auth/join"
        

        // 파라미터 사용
        let param = ["email":email, "joinType":type, "loginId":id!, "major":major, "name":name, "password":password!, "studentId":studentId]
        
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoding: JSONEncoding.default).response { response in
            
            if response.response?.statusCode == 200 {
                
                // 유저 정보 전송 성공하면 인증번호 발송
                self.sendAuthNumberToEmail(email: email)
                
            } else {
                print("유저 정보 전송 실패 중복으로 인한 실패!")
            }
            
        }
    }
    
    private func sendAuthNumberToEmail(email: String) {
        let url = baseUrl + "/api/auth/email"
        
        let param = ["email" : email]
        
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoding: JSONEncoding.default).response { response in
            
            if response.response?.statusCode == 200 {
                
                // 이메일 전송 성공하면 다음 화면
                self.pushToNextVC(email: email)
                
            } else {
                print("이메일 전송 실패!")
            }
        }
    }
    
    func nameCheck(name: String?) -> Bool {
        guard let userName = name else { return false }
        
        if userName.isEmpty {
            print("이름이 비었습니다!")
            return false
        } else if !RegisterModel.isValidName(name: userName) {
            print("이름의 형식이 틀렸습니다!")
            return false
        }
        
        return true
    }
    
    func studentIdCheck(studentId: String?) -> Bool {
        guard let userStudentId = studentId else { return false }
        
        if userStudentId.isEmpty {
            print("학번이 비었습니다!")
            return false
        } else if !RegisterModel.isValidStudentId(studentId: userStudentId) {
            print("학번의 형식이 틀렸습니다!")
            return false
        }
        
        return true
    }
    
    func emailCheck(email: String?) -> Bool {
        guard let userEmail = email else { return false }
        let userSuwonEmail = userEmail + "@suwon.ac.kr"
        
        if userEmail.isEmpty {
            print("이메일이 비었습니다!")
            return false
        } else if !RegisterModel.isValidEmail(email: userSuwonEmail) {
            print("이메일의 형식이 틀렸습니다!")
            return false
        }
        
        return true
    }
    
    func pushToNextVC(email: String) {
        let emailVerifyStoryboard = UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard.instantiateViewController(withIdentifier: "EmailVerifyVC") as? EmailVerifyController else { return }
        
        emailVerifyViewController.email = email

        self.navigationController?.pushViewController(emailVerifyViewController, animated: true)
    }
}

extension RegisterEmailAndInformationController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Majors.data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Majors.data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.majorTextField.text = "\(Majors.data[row])"
    }
    
}
