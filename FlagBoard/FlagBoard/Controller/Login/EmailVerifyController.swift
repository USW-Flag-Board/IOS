//
//  EmailVerifyController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire

class EmailVerifyController: UIViewController {

    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var authNumTextField: UITextField!
    @IBOutlet weak var completeRegistrationButton: UIButton!
    @IBOutlet weak var sendAuthNumButton: UIButton!
    @IBOutlet weak var authenticateButton: UIButton!
    @IBOutlet weak var emailNoticeLabel: UILabel!
    @IBOutlet weak var authNumNoticeLabel: UILabel!
    
    var id: String?
    var password: String?
    var joinType: String?
    var name: String?
    var nickName: String?
    var major: String?
    var studentId: String?
    var phoneNumber: String?
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyles()
        setOptions()
    }
    
    // MARK: @IBAction Functions
    @IBAction func sendAuthNumButtonPressed(_ sender: UIButton) {
        guard let emailId = emailIdTextField.text else { return }
        self.email = emailId + "@suwon.ac.kr"
        
        switch email {
        case let email where email.isEmpty:
            emailNoticeLabel.text = "이메일을 입력해주세요!"
        case let email where !RegisterModel.isValidEmail(email: email):
            emailNoticeLabel.text = "이메일 형식이 아닙니다!"
        default:
            emailOverlapCheck(email: email)
        }
    }
    
    @IBAction func authenticateButtonPressed(_ sender: UIButton) {
        guard let authNum = authNumTextField.text else { return }
        
        switch authNum {
        case let authNum where authNum.isEmpty:
            authNumNoticeLabel.text = "인증번호를 입력해주세요!"
        default:
            signUp(email: self.email, certification: authNum)
        }
    }
    
    @IBAction func completeRegistrationButtonPressed(_ sender: UIButton) {
        
        if let loginViewController = navigationController?.viewControllers[1] {
            navigationController?.popToViewController(loginViewController, animated: true)
        }

    }
    
    
    // MARK: Functions
    func setStyles() {
        let addressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        addressLabel.textColor = UIColor.white
        addressLabel.font = UIFont.systemFont(ofSize: 13)
        addressLabel.text = "@suwon.ac.kr   "
        emailIdTextField.rightView = addressLabel
        emailIdTextField.rightViewMode = .always
        
        completeRegistrationButton.setCornerRound()
        sendAuthNumButton.setCornerRound()
        authenticateButton.setCornerRound()
        
        emailIdTextField.setRegisterStyle(placeholder: "이메일")
        authNumTextField.setRegisterStyle(placeholder: "인증번호")
    }
    
    func setOptions() {
        // button options
        authenticateButton.setButtonEnable(to: false)
        completeRegistrationButton.setButtonEnable(to: false)
    }
    
    private func emailOverlapCheck(email: String) {
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.checkEmail(email: email))
            .validate()
            .responseDecodable(of: AuthModel.OverlabCheckData.self) { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    if let isEmailOverlab = response.value?.payload {
                        if isEmailOverlab { // 이메일이 중복이면(사용 불가능)
                            self.emailNoticeLabel.text = "이미 가입된 이메일 입니다."
                        } else { // 이메일이 중복이 아니면(사용 가능)
                            self.sendAuthNum(email: email)
                        }
                    }
                    
                default:
                    print("other code ->", statusCode)
                }
            }
    }
    
    private func sendAuthNum(email: String) {
        guard let id = id else { return }
        guard let password = password else { return }
        guard let name = name else { return }
        guard let studentId = studentId else { return }
        guard let major = major else { return }
        guard let joinType = joinType else { return }
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.sendAuthInfo(id: id, password: password, name: name, studentId: studentId, email: email, major: major, joinType: joinType)).response { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    print("회원정보 입력 성공 및 메일 발송 완료")
                    self.emailNoticeLabel.text = "회원정보 입력 성공 및 메일 발송 완료"
                    self.emailIdTextField.isEnabled = false
                    self.emailIdTextField.textColor = UIColor.gray
                    self.authenticateButton.setButtonEnable(to: true)
                case 422:
                    print("사용할 수 없는 비밀번호 입니다. (8~20자 이내 영문, 숫자, 특수문자를 모두 포함)")
                case 500:
                    print("서버 에러입니다. 관리자에게 문의해주세요.")
                default:
                    print("other code ->", statusCode)
                }
            }
    }
    
    private func signUp(email: String, certification: String) {
        
        AlamofireManager
            .shared
            .session
            .request(AuthRouter.signUp(email: email, certification: certification))
            .response { response in
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    print("회원가입 성공했습니다.")
                    self.authNumTextField.isEnabled = false
                    self.authNumTextField.textColor = UIColor.gray
                    self.completeRegistrationButton.setButtonEnable(to: true)
                case 400:
                    print("가입 시간이 만료되었습니다.")
                    self.authNumNoticeLabel.text = "가입 시간이 만료되었습니다."
                case 404:
                    print("존재하지 않는 가입정보 입니다.")
                    self.authNumNoticeLabel.text = "존재하지 않는 가입정보입니다."
                case 409:
                    print("인증번호가 일치하지 않습니다.")
                    self.authNumNoticeLabel.text = "인증번호가 일치하지 않습니다."
                default:
                    print("other code ->", statusCode)
                }
            }
    }
}
