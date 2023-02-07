//
//  JoinTypeController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/07.
//

import UIKit

import DLRadioButton

class JoinTypeController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var normalMemberRadioButton: DLRadioButton!
    @IBOutlet weak var flagMemberRadioButton: DLRadioButton!
    
    //MARK: Properties
    var joinType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonStyles()
        setButtonOptions()
    }
    
    //MARK: @IBAction Functions
    @IBAction func nextButtonPressed(_ sender: Any) {
        let registerIdAndPasswordStoryboard = UIStoryboard(name: "RegisterIdAndPasswordView"
                                                           , bundle: nil)
        guard let registerIdAndPasswordViewController = registerIdAndPasswordStoryboard
            .instantiateViewController(withIdentifier: "RegisterIdAndPasswordVC")
                as? RegisterIdAndPasswordController else { return }
        
        registerIdAndPasswordViewController.joinType = joinType

        self.navigationController?.pushViewController(registerIdAndPasswordViewController,
                                                      animated: true)
    }
    
    
    //MARK: Functions
    func setButtonStyles() {
        nextButton.setCornerRound()
    }

    func setButtonOptions() {
        nextButton.setButtonEnable(to: false)
        
        normalMemberRadioButton.addTarget(self,
                                          action: #selector(anyRadioButtonPressed),
                                          for: .touchUpInside)
        flagMemberRadioButton.addTarget(self,
                                        action: #selector(anyRadioButtonPressed),
                                        for: .touchUpInside)
    }
    
    
    //MARK: @objc Functions
    @objc func anyRadioButtonPressed(_ sender: DLRadioButton) {
        nextButton.setButtonEnable(to: true)
        
        if sender.titleLabel?.text == "일반회원" {
            joinType = "일반"
        } else {
            joinType = "동아리"
        }

    }

}
