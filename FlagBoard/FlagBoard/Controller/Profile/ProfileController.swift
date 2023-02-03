import UIKit

import KeychainSwift
import SideMenu
import Alamofire



class ProfileController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: Properties
    let keyChain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 회원 탈퇴 테스팅
    @IBAction func withdrawalButtonPressed(_ sender: UIButton) {
        
        // 키체인에서 토큰데이터 가져옴
        guard let refreshToken = keyChain.get("refresh_token") else { return }
        guard let accessToken = keyChain.get("access_token") else { return }
        
        let credential = OAuthCredential(accessToken: accessToken, refreshToken: refreshToken)
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        
        // JWT 인증 방식에 필요한 auth interceptor 생성
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                        credential: credential)
        
        print(passwordTextField.text!)
        AlamofireManager
            .shared
            .session
            .request(MembersRouter.withdrawal(password: passwordTextField.text!),
                     interceptor: authInterceptor)
            .validate()
            .response { response in
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    print("회원 탈퇴에 성공하였습니다.")
                case 400:
                    print("비밀번호가 일치하지 않습니다.")
                case 401:
                    print("토큰쪽을 넣지 않았거나 토큰이 만료됨.")
                case 404:
                    print("존재하지 않는 사용자 입니다.")
                default:
                    print("other code ->", statusCode)
                }
            }
    }
    
    //MARK: @IBAction Functions
    @IBAction func didTabMenuButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SideMenuView", bundle: nil)
        let sideMenuViewController: SideMenuController =
            storyboard.instantiateViewController(withIdentifier: "SideMenuController") as!
                                                                                SideMenuController
        let menu = CustomSideMenuNavigationController(rootViewController: sideMenuViewController)
        
        present(menu, animated: true, completion: nil)
    }
    
    //MARK: Functions
}
