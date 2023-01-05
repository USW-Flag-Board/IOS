//
//  LoginController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/03.
//

import UIKit

class LoginController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    @IBAction func didTabRegisterButton(_ sender: Any) {
        let registerStoryboard = UIStoryboard(name: "RegisterView", bundle: nil)
        guard let registerViewController = registerStoryboard.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterController else { return }
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
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
