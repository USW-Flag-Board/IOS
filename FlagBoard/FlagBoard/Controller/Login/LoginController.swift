//
//  LoginController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/12/03.
//

import UIKit

class LoginController: UIViewController {

    //MARK: IBOutlets
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    @IBAction func didTabRegisterButton(_ sender: Any) {
        let registerStoryboard = UIStoryboard(name: "RegisterView", bundle: nil)
        guard let registerViewController = registerStoryboard.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterController else { return }
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
