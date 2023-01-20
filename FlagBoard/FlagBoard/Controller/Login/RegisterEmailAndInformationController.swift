//
//  RegisterEmailAndInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire
import SwiftyJSON


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
        emailOverlap(email: email)
    }
    
    
    // MARK: Functions
    private func emailOverlap(email: String) {
        var url = baseUrl + "/api/auth/"
        url += email + "@suwon.ac.kr"
        
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.default).response { response in
            
            guard let statusCode = response.response?.statusCode, statusCode == 200 else {
                print("중복된 이메일입니다.")
                return }
            
            print("status code ->", statusCode)
            
            self.pushToNextVC()
        }
        
    }
    
    func nameCheck(name: String?) -> Bool {
        guard let userName = name else { return false }
        
        if userName.isEmpty {
            print("이름이 비었습니다!")
            return false
        } else if !isValidName(name: userName) {
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
        } else if !isValidStudentId(studentId: userStudentId) {
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
        } else if !isValidEmail(email: userSuwonEmail) {
            print("이메일의 형식이 틀렸습니다!")
            return false
        }
        
        return true
    }
    
    
    // 이메일 형식 검사
    func isValidEmail(email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let userEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                  return userEmail.evaluate(with: email)
    }
    
    // 이름 형식 검사
    func isValidName(name: String?) -> Bool {
        let nameRegEx = "[가-힣]{2,5}"
        
        let userName = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
                  return userName.evaluate(with: name)
    }
    
    // 학번 형식 검사
    func isValidStudentId(studentId: String?) -> Bool {
        let studentIdRegEx = "[0-9]{8}"
        
        let userStudentId = NSPredicate(format:"SELF MATCHES %@", studentIdRegEx)
                  return userStudentId.evaluate(with: studentId)
    }
    
    func pushToNextVC() {
        let emailVerifyStoryboard = UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard.instantiateViewController(withIdentifier: "EmailVerifyVC") as? EmailVerifyController else { return }

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
