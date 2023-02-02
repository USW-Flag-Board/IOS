//
//  LoginController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/03.
//

import UIKit

import Alamofire
import KeychainSwift

class LoginController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    
    //MARK: Properties
    let keyChain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: @IBAction Functions
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
    
    
    //MARK: Functions
    private func login(id: String, password: String) {
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.login(id: id, password: password))
            .responseDecodable(of: TokenData.self) { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    print("로그인 성공! JWT토큰 발급")
                    
                    // response refresh, access token data
                    guard let refreshToken = response.value?.refreshToken else { return }
                    guard let accessToken = response.value?.accessToken else { return }
                    
                    // keyChain Setting
                    self.keyChain.set(refreshToken, forKey: "refresh_token")
                    self.keyChain.set(accessToken, forKey: "access_token")
                    
                case 404:
                    print("존재하지 않는 사용자입니다.")
                default:
                    print("other code ->", statusCode)
                }
            }
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


    
}
