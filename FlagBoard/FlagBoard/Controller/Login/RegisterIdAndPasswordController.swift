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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonStyles()
        setTextFieldOptions()
        setLabelOptions()
        setButtonOptions()
        
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {

    }
    
    
    // MARK: Functions
    func setButtonStyles() {
        nextButton.setCornerRound()
    }
    
    func setTextFieldOptions() {
        idTextField.addTarget(self,
                              action: #selector(checkIdTextField),
                              for: .editingDidEnd)
        passwordTextField.addTarget(self,
                                    action: #selector(checkPasswordTextField),
                                    for: .editingDidEnd)
        reconfirmPasswordTextField.addTarget(self,
                                             action: #selector(checkReconfirmPasswordTextField),
                                             for: .editingDidEnd)
    }
    
    func setLabelOptions() {
        idNoticeLabel.text = ""
        passwordNoticeLabel.text = ""
        reconfirmPasswordNoticeLabel.text = ""
    }
    
    func setButtonOptions() {
        nextButton.setButtonEnable(to: false)
    }
    
    func IdOverlap(id: String) {
        
    }
    
    func pushToNextVC(id: String, password: String) {
        // 다음 화면으로 전환
        let registerEmailAndInformationStoryboard =
        UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard
            .instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC")
                as? RegisterEmailAndInformationController else { return }

        registerEmailAndInformationViewController.id = id
        registerEmailAndInformationViewController.password = password

        self.navigationController?.pushViewController(registerEmailAndInformationViewController,
                                                      animated: true)
    }
    
    // MARK: @objc Functions
    @objc func checkIdTextField(_ sender: UITextField){
        guard let id = idTextField.text else { return }
        
        switch id {
        case let id where id.isEmpty:
            idNoticeLabel.text = "아이디를 입력해주세요!"
        case let id where !RegisterModel.isValidId(id: id):
            idNoticeLabel.text = "아이디의 형식이 이상합니다"
        default:
            idNoticeLabel.text = "사용가능한 아이디입니다."
        }
    }
    
    @objc func checkPasswordTextField(_ sender: UITextField){
        guard let password = passwordTextField.text else { return }
        
        switch password {
        case let password where password.isEmpty:
            passwordNoticeLabel.text = "비밀번호를 입력해주세요!"
        case let password where !RegisterModel.isValidPassword(password: password):
            passwordNoticeLabel.text = "비밀번호의 형식이 이상합니다"
        default:
            passwordNoticeLabel.text = "사용가능한 비밀번호입니다."
        }
    }
    
    @objc func checkReconfirmPasswordTextField(_ sender: UITextField){
        guard let password = passwordTextField.text else { return }
        guard let reconfirmPassword = reconfirmPasswordTextField.text else { return }
        
        switch reconfirmPassword {
        case let reconfirmPassword where reconfirmPassword.isEmpty:
            reconfirmPasswordNoticeLabel.text = "비밀번호 재확인을 입력해주세요!"
        case let reconfirmPassword where !RegisterModel.confirmPassword(first: password,
                                                                        second: reconfirmPassword):
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치하지 않습니다!"
        default:
            reconfirmPasswordNoticeLabel.text = "비밀번호가 일치합니다!"
        }
    }
}
