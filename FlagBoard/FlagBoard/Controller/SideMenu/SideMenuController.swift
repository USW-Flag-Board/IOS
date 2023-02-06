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
        guard let loginViewController = loginStoryboard
            .instantiateViewController(withIdentifier: "LoginVC")
                as? LoginController else { return }
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let agreementStoryboard = UIStoryboard(name: "AgreementView", bundle: nil)
        guard let agreementViewController = agreementStoryboard
            .instantiateViewController(withIdentifier: "AgreementVC")
                as? AgreementController else { return }

        self.navigationController?.pushViewController(agreementViewController, animated: true)
    }
}
