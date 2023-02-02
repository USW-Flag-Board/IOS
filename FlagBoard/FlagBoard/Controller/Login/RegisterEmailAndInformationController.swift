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
    var name = ""
    var studentId = ""
    var major = ""
    var joinType = ""
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        self.majorTextField.inputView = majorPicker
        
        print(id!, password!)
    }
    
    // MARK: @IBAction Functions
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        
        guard let name = nameTextField.text, nameCheck(name: name) else { return }
        guard let studentId = studentIdTextField.text,
                studentIdCheck(studentId: studentId) else { return }
        guard let major = majorTextField.text, !major.isEmpty else {
            print("전공이 비었습니다!")
            return }
        guard let joinType = typeTextField.text, !joinType.isEmpty else { return }
        guard let emailId = emailTextField.text, emailCheck(emailId: emailId) else { return }
        
        // 위 모든 검사 통과하면 전역 변수에 넣기
        self.name = name
        self.studentId = studentId
        self.major = major
        self.joinType = joinType
        self.email = emailId + "@suwon.ac.kr"
        
        // 위 모든 검사를 통과하면 이메일 중복 체크
        emailOverlap(email: self.email)
    }
    
    
    // MARK: Functions
    private func emailOverlap(email: String) {
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.checkEmail(email: email)).response { response in
            guard let statusCode = response.response?.statusCode else { return }
            
            switch statusCode {
            case 200:
                print("사용 가능한 이메일입니다.")
                self.sendUserInfoAndEmail(name: self.name, studentId: self.studentId,
                                          major: self.major, joinType: self.joinType,
                                          email: self.email)
            case 400:
                print("이메일 형식이 아닙니다.")
            case 409:
                print("이미 사용 중인 이메일입니다.")
            case 422:
                print("수원대학교 웹 메일 주소가 아닙니다.")
            default:
                print("other code ->", statusCode)
            }
        }
    }
    
    private func sendUserInfoAndEmail(name: String, studentId: String,
                                      major: String, joinType: String,
                                      email:String) {
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.sendAuthInfo(id: id!, password: password!, name: name,
                                             studentId: studentId, email: email, major: major,
                                             joinType: joinType)).response { response in
                
            guard let statusCode = response.response?.statusCode else { return }
            
            switch statusCode {
            case 200:
                print("회원정보 입력 성공 및 메일 발송 완료")
                self.pushToNextVC(email: self.email)
            case 422:
                print("사용할 수 없는 비밀번호 입니다. (8~20자 이내 영문, 숫자, 특수문자를 모두 포함)")
            case 500:
                print("서버 에러입니다. 관리자에게 문의해주세요.")
            default:
                print("other code ->", statusCode)
            }
        }
    }
    
    func nameCheck(name: String?) -> Bool {
        guard let userName = name else { return false }
        
        switch userName {
        case let name where name.isEmpty:
            print("이름이 비었습니다!")
            return false
        case let name where !RegisterModel.isValidName(name: name):
            print("이름의 형식이 틀렸습니다!")
            return false
        default:
            return true
        }
    }
    
    func studentIdCheck(studentId: String?) -> Bool {
        guard let userStudentId = studentId else { return false }
        
        switch userStudentId {
        case let studentId where studentId.isEmpty:
            print("학번이 비었습니다!")
            return false
        case let studentId where !RegisterModel.isValidStudentId(studentId: studentId):
            print("학번의 형식이 틀렸습니다!")
            return false
        default:
            return true
        }
    }
    
    func emailCheck(emailId: String?) -> Bool {
        guard let userEmailId = emailId else { return false }
        let userEmail = userEmailId + "@suwon.ac.kr"
        
        switch userEmail {
        case let email where email.isEmpty:
            print("학번이 비었습니다!")
            return false
        case let email where !RegisterModel.isValidEmail(email: email):
            print("학번의 형식이 틀렸습니다!")
            return false
        default:
            return true
        }
    }
    
    func pushToNextVC(email: String) {
        let emailVerifyStoryboard = UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard.instantiateViewController(withIdentifier: "EmailVerifyVC") as? EmailVerifyController else { return }
        
        // 다음 화면에 전달할 요소
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
