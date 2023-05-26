//
//  AgreementController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/06.
//

import UIKit

import Alamofire
import DLRadioButton

class AgreementController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var agreementButton: UIButton!
    @IBOutlet weak var allAgreeRadioButton: DLRadioButton!
    @IBOutlet weak var firstRadioButton: DLRadioButton!
    @IBOutlet weak var secondRadioButton: DLRadioButton!
    
    //MARK: Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonStyles()
        setButtonOptions()
    }
    
    //MARK: @IBAction Functions
    @IBAction func allAgreeRadioButtonPressed(_ sender: DLRadioButton) {
        
        if allAgreeRadioButton.isSelected {
            changeRadioStatus(firstRadioButton, to: true)
            changeRadioStatus(secondRadioButton, to: true)
            agreementButton.setButtonEnable(to: true)
           
        } else {
            changeRadioStatus(firstRadioButton, to: false)
            changeRadioStatus(secondRadioButton, to: false)
            agreementButton.setButtonEnable(to: false)
        }
    }
    
    @IBAction func agreeButtonPressed(_ sender: UIButton) {
        let joinTypeStoryboard = UIStoryboard(name: "JoinTypeView", bundle: nil)
        guard let joinTypeViewController = joinTypeStoryboard
            .instantiateViewController(withIdentifier: "JoinTypeVC")
                as? JoinTypeController else { return }

        self.navigationController?.pushViewController(joinTypeViewController, animated: true)
    }
    
    
    //MARK: Functions
    func setButtonStyles() {
        agreementButton.setCornerRound()
    }
    
    func setButtonOptions() {
        agreementButton.setButtonEnable(to: false)
    
        allAgreeRadioButton.isMultipleSelectionEnabled = true
        firstRadioButton.isMultipleSelectionEnabled = true
        secondRadioButton.isMultipleSelectionEnabled = true
        
        firstRadioButton.addTarget(self,
                                   action: #selector(anyRadioButtonPressed),
                                   for: .touchUpInside)
        secondRadioButton.addTarget(self,
                                    action: #selector(anyRadioButtonPressed),
                                    for: .touchUpInside)
    }
    
    func changeRadioStatus(_ sender: DLRadioButton, to: Bool) {
        if sender.isSelected != to {
            sender.isSelected = to
        }
    }
    
        
    //MARK: @objc Functions
    @objc func anyRadioButtonPressed() {
        if firstRadioButton.isSelected || secondRadioButton.isSelected {
            changeRadioStatus(allAgreeRadioButton, to: false)
            agreementButton.setButtonEnable(to: false)
        }
        if firstRadioButton.isSelected && secondRadioButton.isSelected {
            changeRadioStatus(allAgreeRadioButton, to: true)
            agreementButton.setButtonEnable(to: true)
        }
    }
}
