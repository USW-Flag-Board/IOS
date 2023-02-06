//
//  AgreementController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/02/06.
//

import UIKit

import Alamofire

class AgreementController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var agreementButton: UIButton!
    
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonStyles()
    }
    
    //MARK: @IBAction Functions
    
    //MARK: Functions
    func setButtonStyles() {
        self.agreementButton.layer.cornerRadius = 20
    }
}
