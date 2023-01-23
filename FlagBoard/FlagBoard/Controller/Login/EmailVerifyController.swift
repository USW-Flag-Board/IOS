//
//  EmailVerifyController.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/01/19.
//

import UIKit

import Alamofire

class EmailVerifyController: UIViewController {

    @IBOutlet weak var authNumTextField: UITextField!
    
    var email: String?
    let baseUrl = API.BASE_URL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AuthenticateButtonPressed(_ sender: UIButton) {
        guard let authNumber = authNumTextField.text, !authNumber.isEmpty else {
            print("인증번호가 비어있습니다")
            return }
        
        signUp(email: email!, authNumber: authNumber)
    }
    
    private func signUp(email: String, authNumber: String) {
        let url = baseUrl + "/api/auth/sign-up"
        
        // 파라미터 사용
        let param = ["email":email, "certification":authNumber]
        
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoding: JSONEncoding.default).response { response in
            guard let statusCode = response.response?.statusCode, statusCode == 200 else {
                print("인증번호 전송 실패")
                return }
            
            print("sign up status code ->", statusCode)
        }
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
