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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonStyles()
        setLabelOptions()
        setButtonOptions()
        
    }
    

    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {

    }
    
    
    // MARK: Functions
    func setButtonStyles() {
        nextButton.layer.cornerRadius = 20
    }
    func setLabelOptions() {
        idNoticeLabel.text = ""
        passwordNoticeLabel.text = ""
        reconfirmPasswordNoticeLabel.text = ""
    }
    
    func setButtonOptions() {
        changeButtonEnable(to: false)
    }
    
    func changeButtonEnable(to: Bool) {
        if to {
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.2156939507, green: 0.5384917259, blue: 0.4589682817, alpha: 1)
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.5568627715, blue: 0.5568627119, alpha: 1)
        }
    }
    
    
    func idCheck(id: String?) -> Bool { // id 체크를 관장하는 함수
        guard let userId = id else { return false }
        
        switch userId {
        case let id where id.isEmpty:
            print("아이디가 비어있음")
            return false
        case let id where !RegisterModel.isValidId(id: id):
            print("아이디의 형식이 이상함")
            return false
        default:
            return true
        }
    }
    
    
    // password 체크를 관장하는 함수
    func passwordCheck(firstPassword: String?, secondPassword: String?) -> Bool {
        return true
    }
    
    func IdOverlap(id: String) {
        
    }
    
    func pushToNextVC(id: String, password: String) {
        // 다음 화면으로 전환
        let registerEmailAndInformationStoryboard = UIStoryboard(name: "RegisterEmailAndInformationView", bundle: nil)
        guard let registerEmailAndInformationViewController = registerEmailAndInformationStoryboard.instantiateViewController(withIdentifier: "RegisterEmailAndInformationVC") as? RegisterEmailAndInformationController else { return }

        registerEmailAndInformationViewController.id = id
        registerEmailAndInformationViewController.password = password

        self.navigationController?.pushViewController(registerEmailAndInformationViewController, animated: true)
    }
}
