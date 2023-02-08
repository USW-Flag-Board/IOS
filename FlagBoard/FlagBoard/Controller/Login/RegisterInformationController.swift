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

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyles()
        setOptions()
    }
    
    
    // MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
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
    
    // MARK: @objc Functions
    
    // 세부사항이 정해지지 않았으므로 지금은 공백검사만 실행함
    @objc func checkTextField() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let nickName = nickNameTextField.text, !nickName.isEmpty else { return }
        guard let major = majorTextField.text, !major.isEmpty else { return }
        guard let studentId = studentIdTextField.text, !studentId.isEmpty else { return }
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else { return }
        
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
