import UIKit

class BulletinBoardSelectionController: UIViewController{

    
    //MARK: IBOutlets
    @IBOutlet weak var boardSeletionTableview: UITableView!
    
    var boardNameList : [String] = ["!!공지!!", "정보게시판", "자유게시판", "동아리 이모저모", "Activity"]
    
    

    
    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "BulletinBoardSelectionTableViewCell", bundle: nil)
        
        boardSeletionTableview.register(nibName, forCellReuseIdentifier: "boardSelectionTableCell")
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerXib()
        
        boardSeletionTableview.delegate = self
        boardSeletionTableview.dataSource = self
    }
    


}


 // MARK: - UITableViewDataSource
extension BulletinBoardSelectionController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return boardNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = boardSeletionTableview.dequeueReusableCell(withIdentifier: "boardSelectionTableCell", for: indexPath) as! BulletinBoardSelectionTableViewCell
        
        cell.boardLabel.text = boardNameList[indexPath.row]
        
        return cell
    }
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: false)
            

            switch indexPath.row{
            case 0:
                
                let sb = UIStoryboard(name: "Freeboard", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "Freeboard") as! FreeBoardViewController
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            default:
                return
            }
        }
     

}




