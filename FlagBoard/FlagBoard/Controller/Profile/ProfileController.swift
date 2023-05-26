import UIKit

import KeychainSwift
import SideMenu
import Alamofire



class ProfileController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImgUrlLabel: UILabel!
    @IBOutlet weak var studenIdLabel: UILabel!
    
    //MARK: Properties
    let keyChain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let accessToken = keyChain.get("access_token") {
            getMyProfile()
        }
        
    }
    
    
    //MARK: @IBAction Functions
    @IBAction func sideMenuButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SideMenuView", bundle: nil)
        let sideMenuViewController: SideMenuController =
            storyboard.instantiateViewController(withIdentifier: "SideMenuController") as!
                                                                                SideMenuController
        let menu = CustomSideMenuNavigationController(rootViewController: sideMenuViewController)
        
        present(menu, animated: true, completion: nil)
    }
    
    //MARK: Functions
    func getMyProfile() {
        
        // 키체인에서 토큰데이터 가져옴
        guard let refreshToken = keyChain.get("refresh_token") else { return }
        guard let accessToken = keyChain.get("access_token") else { return }
        
        let credential = OAuthCredential(accessToken: accessToken, refreshToken: refreshToken)
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        
        // JWT 인증 방식에 필요한 auth interceptor 생성
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                        credential: credential)
        
        AlamofireManager
            .shared
            .session
            .request(MembersRouter.getMyProfile, interceptor: authInterceptor)
            .validate()
            .responseDecodable(of: ProfileData.self) { response in
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200:
                    print("내 정보를 가져왔습니다")
                    
                    let profileData = response.value?.payload
                    
                    debugPrint(response)
                    self.bioLabel.text = profileData?.bio
                    self.emailLabel.text = profileData?.email
                    self.majorLabel.text = profileData?.major
                    self.nameLabel.text = profileData?.name
                    self.nickNameLabel.text = profileData?.nickName
                    self.phoneNumberLabel.text = profileData?.phoneNumber
                    self.profileImgUrlLabel.text = profileData?.profileImg
                    self.studenIdLabel.text = profileData?.studentID
                    
                    
                case 401:
                    print("토큰쪽을 넣지 않았거나 토큰이 만료됨.")
                default:
                    print("other code ->", statusCode)
                }
            }
    }
}
