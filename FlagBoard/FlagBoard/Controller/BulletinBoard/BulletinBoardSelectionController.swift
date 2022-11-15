import UIKit

class BulletinBoardSelectionController: UIViewController{

    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var boardNameList : [String] = ["공지", "정보게시판", "자유게시판", "동아리 이모저모", "Activity"]

    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "BulletinBoardSelectionTableViewCell", bundle: nil)
        
        tableView.register(nibName, forCellReuseIdentifier: "boardSelectionTableCell")
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerXib()
        
        tableView.delegate = self
        tableView.dataSource = self
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
    

}


 // MARK: - UITableViewDataSource

extension BulletinBoardSelectionController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return boardNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boardSelectionTableCell", for: indexPath) as! BoardSelectionTableViewCell
        
        cell.boardLabel.text = boardNameList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let boardViewStoryboard = UIStoryboard(name: "BoardView", bundle: nil)
        guard let boardViewController = boardViewStoryboard.instantiateViewController(withIdentifier: "freeBoardVC") as? FreeBoardViewController else { return }
        
        switch Int(indexPath.row){
        case 0:
            boardViewController.text = "공지"
            
        case 1:
            boardViewController.text = "정보게시판"
            
        case 2:
            boardViewController.text = "자유게시판"
            
        case 3:
            boardViewController.text = "동아리 이모저모"
            
        case 4:
            boardViewController.text = "Activity"
            
        default:
            break
        
        }
        
        
        self.navigationController?.pushViewController(boardViewController, animated: true)
        
//        let deselectRow: Void = tableView.deselectRow(at: indexPath, animated: false)
//        print(deselectRow)
//        print("indexPath.row - \(indexPath.row)")
//        switch Int(indexPath.row){
//        case 0:
//
////            self.navigationController?.pushViewController(vc, animated: true)
//
//        default:
//            return
//        }
    }
     

}




