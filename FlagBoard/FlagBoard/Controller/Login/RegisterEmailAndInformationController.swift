//
//  RegisterEmailAndInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

class RegisterEmailAndInformationController: UIViewController {
    
    @IBOutlet weak var majorTextField: UITextField!
    
    var id: String?
    var password: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let picker = UIPickerView()
        picker.delegate = self
        self.majorTextField.inputView = picker
        
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
