//
//  RegisterController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/14.
//

import UIKit

import Alamofire


class RegisterIdAndPasswordController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reconfirmPasswordTextField: UITextField!
    @IBOutlet weak var idNoticeLabel: UILabel!
    @IBOutlet weak var passwordNoticeLabel: UILabel!
    @IBOutlet weak var reconfirmPasswordNoticeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: Properties
    var joinType: String?
    var isIdValid: Bool = false
    var isPasswordValid: Bool = false
    var isReconfirmPasswordValid: Bool = false
    
    private var id: String = ""
    private var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyles()
        setOptions()
        
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if let joinType = self.joinType {
            pushToNextVC(id: self.id, password: self.password, joinType: joinType)
        }
        
    }
    
    
    // MARK: Functions
    func setStyles() {
        nextButton.setCornerRound()
        idTextField.setRegisterStyle(placeholder: "아이디")
        passwordTextField.setRegisterStyle(placeholder: "비밀번호")
        reconfirmPasswordTextField.setRegisterStyle(placeholder: "비밀번호 확인")
    }
    
    func setOptions() {
        // text field options
        idTextField.addTarget(self,
                              action: #selector(checkIdTextField),
                              for: .editingDidEnd)
        passwordTextField.addTarget(self,
                                    action: #selector(checkPasswordTextField),
                                    for: .editingDidEnd)
        reconfirmPasswordTextField.addTarget(self,
                                             action: #selector(checkPasswordTextField),
                                             for: .editingDidEnd)
        
        // label options
        idNoticeLabel.text = ""
        passwordNoticeLabel.text = ""
        reconfirmPasswordNoticeLabel.text = ""
        
        // button options
        nextButton.setButtonEnable(to: false)
    }
    
    
    func IdOverlapCheck(id: String) {
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.checkId(id: id))
            .validate()
            .responseDecodable(of: AuthModel.OverlabCheckData.self) { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    if let isIdOverlab = response.value?.payload {
                        if isIdOverlab { // 아이디가 중복이면(사용 불가능)
                            self.idNoticeLabel.text = "중복된 아이디입니다."
                            
                        } else { // 아이디가 중복이 아니면(사용 가능)
                            self.idNoticeLabel.text = "사용가능한 아이디입니다."
                            self.isIdValid = true
                            self.id = id
                            self.allAvailableCheck()
                        }
                    }

                default:
                    print("other code ->", statusCode)
                }
            }
    }
    
    func allAvailableCheck() {
        // 모두 다 유효하면 next 버튼 활성화
        if isIdValid && isPasswordValid && isReconfirmPasswordValid {
            nextButton.setButtonEnable(to: true)
        } else {
            nextButton.setButtonEnable(to: false)
        }
    }
    
    func pushToNextVC(id: String, password: String, joinType: String) {
        let registerInformationStoryboard =
        UIStoryboard(name: "RegisterInformationView", bundle: nil)
        guard let registerInformationViewController = registerInformationStoryboard
            .instantiateViewController(withIdentifier: "RegisterInformationVC")
                as? RegisterInformationController else { return }
        
        registerInformationViewController.joinType = joinType
        registerInformationViewController.id = id
        registerInformationViewController.password = password

        self.navigationController?.pushViewController(registerInformationViewController,
                                                      animated: true)
    }
    
    // MARK: @objc Functions
    @objc func checkIdTextField(_ sender: UITextField){
        
        self.isIdValid = false
        
        guard let id = idTextField.text else { return }
        
        switch id {
        case let id where id.isEmpty:
            idNoticeLabel.text = "아이디를 입력해주세요!"
        case let id where !RegisterModel.isValidId(id: id):
            idNoticeLabel.text = "아이디의 형식이 맞지 않습니다."
        default:
            IdOverlapCheck(id: id)
        }
        allAvailableCheck()
    }
    
    @objc func checkPasswordTextField(_ sender: UITextField){
        self.isPasswordValid = false
        self.isReconfirmPasswordValid = false
        guard let password = passwordTextField.text else { return }
        guard let reconfirmPassword = reconfirmPasswordTextField.text else { return }
        
       
        switch password {
        case let password where password.isEmpty:
            passwordNoticeLabel.text = "비밀번호를 입력해주세요!"
        case let password where !RegisterModel.isValidPassword(password: password):
            passwordNoticeLabel.text = "비밀번호의 형식이 이상합니다."
        default:
            self.isPasswordValid = true
            self.password = password
            passwordNoticeLabel.text = "사용가능한 비밀번호입니다."
        }
        
        switch reconfirmPassword {
        case let reconfirmPassword where reconfirmPassword.isEmpty:
            reconfirmPasswordNoticeLabel.text = "비밀번호 재확인을 입력해주세요!"
        case let reconfirmPassword where
            !RegisterModel.confirmPassword(first: password,second: reconfirmPassword):
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치하지 않습니다!"
        default:
            self.isReconfirmPasswordValid = true
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치합니다."
        }
        allAvailableCheck()
    }
    
    @objc func checkReconfirmPasswordTextField(_ sender: UITextField){
        
        guard let password = passwordTextField.text else { return }
        guard let reconfirmPassword = reconfirmPasswordTextField.text else { return }
        
        switch reconfirmPassword {
        case let reconfirmPassword where reconfirmPassword.isEmpty:
            reconfirmPasswordNoticeLabel.text = "비밀번호 재확인을 입력해주세요!"
        case let reconfirmPassword where
            !RegisterModel.confirmPassword(first: password,second: reconfirmPassword):
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치하지 않습니다!"
        default:
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치합니다."
            self.isReconfirmPasswordValid = true
        }
        allAvailableCheck()
    }
    
}
