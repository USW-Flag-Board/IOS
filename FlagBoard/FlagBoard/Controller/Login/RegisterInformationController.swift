//
//  RegisterInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/08.
//

import UIKit

class RegisterInformationController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var studentIdTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: Properties
    var id: String?
    var password: String?
    var joinType: String?
    
    private var name: String = ""
    private var nickName: String = ""
    private var major: String = ""
    private var studentId: String = ""
    private var phoneNumber: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyles()
        setOptions()
    }
    
    
    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let id = self.id else { return }
        guard let password = self.password else { return }
        guard let joinType = self.joinType else { return }
        
        pushToNextVC(id: id, password: password, joinType: joinType,
                     name: self.name, nickName: self.nickName, major: self.major,
                     studentId: self.studentId, phoneNumber: self.phoneNumber)
    }
    
    
    // MARK: Functions
    func setStyles() {
        nextButton.setCornerRound()
    }
    
    func setOptions() {
        // text field options
        nameTextField.addTarget(self,
                                action: #selector(checkTextField), for: .editingDidEnd)
        nickNameTextField.addTarget(self,
                                    action: #selector(checkTextField), for: .editingDidEnd)
        majorTextField.addTarget(self,
                                 action: #selector(checkTextField), for: .editingDidEnd)
        studentIdTextField.addTarget(self,
                                     action: #selector(checkTextField), for: .editingDidEnd)
        phoneNumberTextField.addTarget(self,
                                       action: #selector(checkTextField), for: .editingDidEnd)
        
        let majorPicker = UIPickerView()
        majorPicker.delegate = self
        self.majorTextField.inputView = majorPicker
        
        // button options
        nextButton.setButtonEnable(to: false)
    }
    
    func pushToNextVC(id: String, password: String, joinType: String,
                      name: String, nickName: String, major: String,
                      studentId: String, phoneNumber: String) {
        let emailVerifyStoryboard =
        UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard
            .instantiateViewController(withIdentifier: "EmailVerifyVC")
                as? EmailVerifyController else { return }
        
        emailVerifyViewController.id = id
        emailVerifyViewController.password = password
        emailVerifyViewController.joinType = joinType
        emailVerifyViewController.name = name
        emailVerifyViewController.nickName = nickName
        emailVerifyViewController.major = major
        emailVerifyViewController.studentId = studentId
        emailVerifyViewController.phoneNumber = phoneNumber

        self.navigationController?.pushViewController(emailVerifyViewController,
                                                      animated: true)
    }
    
    // MARK: @objc Functions
    
    // 세부사항이 정해지지 않았으므로 지금은 공백검사만 실행함
    @objc func checkTextField() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let nickName = nickNameTextField.text, !nickName.isEmpty else { return }
        guard let major = majorTextField.text, !major.isEmpty else { return }
        guard let studentId = studentIdTextField.text, !studentId.isEmpty else { return }
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else { return }
        
        self.name = name
        self.nickName = nickName
        self.major = major
        self.studentId = studentId
        self.phoneNumber = phoneNumber
        
        // 공백란이 없으면 다음 버튼활성화
        nextButton.setButtonEnable(to: true)
    }
}

extension RegisterInformationController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RegisterModel.Majors.data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int) -> String? {
        return RegisterModel.Majors.data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        self.majorTextField.text = "\(RegisterModel.Majors.data[row])"
    }
    
}
