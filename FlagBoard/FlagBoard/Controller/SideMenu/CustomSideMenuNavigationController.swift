import UIKit
import SideMenu

class CustomSideMenuNavigationController: SideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn

    }
    
}
