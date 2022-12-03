import UIKit
import SideMenu

class SideMenuController: UIViewController {
    
    //MARK: IBOutlets
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Functions
    @IBAction func didTabLoginButton(_ sender: Any) {
        let loginStoryboard = UIStoryboard(name: "LoginView", bundle: nil)
        guard let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginController else { return }
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
