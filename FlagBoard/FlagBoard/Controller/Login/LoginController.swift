//
//  LoginController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginStatusLabel: UILabel!
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    @IBAction func registerButtonPressed(_ sender: Any) {
        let registerIdAndPasswordStoryboard = UIStoryboard(name: "RegisterIdAndPasswordView", bundle: nil)
        guard let RegisterIdAndPasswordViewController = registerIdAndPasswordStoryboard.instantiateViewController(withIdentifier: "RegisterIdAndPasswordVC") as? RegisterIdAndPasswordController else { return }

        self.navigationController?.pushViewController(RegisterIdAndPasswordViewController, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let id = idTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        login(id: id, password: password)
    }
    
    func moveToMainTap() {
        
        let mainViewStoryboard = UIStoryboard(name: "MainView", bundle: nil)
        guard mainViewStoryboard.instantiateViewController(withIdentifier: "mainTabView") is TabBarController else { return }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func shakeLabel(label: UILabel) -> Void{
        UIView.animate(withDuration: 0.1, animations: {
            label.frame.origin.x -= 7
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                label.frame.origin.x += 14
             }, completion: { _ in
                 UIView.animate(withDuration: 0.1, animations: {
                    label.frame.origin.x -= 7
                })
            })
        })
    }
    
    private func login(id: String, password: String) {
        
        
        
//        var url = "http://3.39.36.239:8080" + "/api/auth/login"
//        let parameter: Parameters = [
//            "loginId": id,
//            "password": password
//        ]
//
//        AF.request(url,
//                   method: .post,
//                   parameters: parameter,
//                   encoding: JSONEncoding.default).responseJSON { response in
//
//            if response.response?.statusCode == 200 {
//                self.moveToMainTap()
//            } else {
//
//                //또 틀리면 경고문 흔들기
//                if self.loginStatusLabel.text != "" {
//                    self.shakeLabel(label: self.loginStatusLabel)
//                }
//
//                self.loginStatusLabel.text = "로그인 실패. 아이디와 비밀번호를 다시 입력해주세요."
//                self.loginStatusLabel.textColor = UIColor.red
//
//
//            }
//
//            print("----------------------")
//            print("< login >")
//            print(JSON(response.data) ?? "")
//            print(response.response?.statusCode)
//            print("----------------------")
//        }
            
    }


    
}
