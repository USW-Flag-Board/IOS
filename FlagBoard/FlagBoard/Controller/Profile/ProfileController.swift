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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
