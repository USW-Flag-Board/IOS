//
//  RegisterEmailAndInformationController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

class RegisterEmailAndInformationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Functions
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        let emailVerifyStoryboard = UIStoryboard(name: "EmailVerifyView", bundle: nil)
        guard let emailVerifyViewController = emailVerifyStoryboard.instantiateViewController(withIdentifier: "EmailVerifyVC") as? EmailVerifyController else { return }

        self.navigationController?.pushViewController(emailVerifyViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
