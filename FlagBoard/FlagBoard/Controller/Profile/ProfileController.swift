import UIKit
import SideMenu

class ProfileController: UIViewController {

    //MARK: IBOutlets
    
    //MARK: Properties
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Button Actions
    @IBAction func didTabMenuButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SideMenuView", bundle: nil)
        let sideMenuViewController: SideMenuController =
            storyboard.instantiateViewController(withIdentifier: "SideMenuController") as!
                                                                                SideMenuController
        let menu = CustomSideMenuNavigationController(rootViewController: sideMenuViewController)
        
        present(menu, animated: true, completion: nil)
    }
    
    //MARK: Design Functions
}
