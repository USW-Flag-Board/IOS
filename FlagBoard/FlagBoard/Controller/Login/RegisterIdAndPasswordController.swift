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
    

    // MARK: Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        guard let id = idTextField.text, !id.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        let registerEmailAndInformationStoryboard = UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard.instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC") as? RegisterEmailAndInformationController else { return }
        
        registerEmailAndInformationViewController.id = id
        registerEmailAndInformationViewController.password = password

        self.navigationController?.pushViewController(registerEmailAndInformationViewController, animated: true)
    }
    
    
    
    // id 형식 검사(형식은 미정)
    func isValidId(id: String?) -> Bool {
        let idRegEx = ""
        
        let userId = NSPredicate(format:"SELF MATCHES %@", idRegEx)
                  return userId.evaluate(with: id)
    }
    
    // 비밀 번호 자릿수 검사
    func isValidPassword(password: String?) -> Bool {
        if let userPassword = password {
                    if userPassword.count < 8 {
                        return false
                    }
                }
        return true
    }
}
