import UIKit
import SideMenu

class SideMenuController: UIViewController {
    
    //MARK: IBOutlets
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Functions
    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginStoryboard = UIStoryboard(name: "LoginView", bundle: nil)
        guard let loginViewController = loginStoryboard
            .instantiateViewController(withIdentifier: "LoginVC")
                as? LoginController else { return }
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    @IBAction func settingButtonPressed(_ sender: Any) {
        let settingStoryboard = UIStoryboard(name: "SettingView", bundle: nil)
        guard let settingViewController = settingStoryboard
            .instantiateViewController(withIdentifier: "SettingVC")
                as? SettingController else { return }
        
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}
