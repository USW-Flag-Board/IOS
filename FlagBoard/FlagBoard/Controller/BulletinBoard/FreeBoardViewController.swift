//
//  FreeBoardViewController.swift
//  FlagBoard
//
//  Created by 송지연 on 2022/10/29.
//

import UIKit

class FreeBoardViewController: UIViewController {

    @IBOutlet weak var boardLocationLabel: UILabel!
    @IBOutlet weak var boardNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollButton: UIButton!
    
    var text : String = ""
    var dataGet : [DummyData] = DummyData.sampleData0
    
    
    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "FreeBoardXibViewCell", bundle: nil)
    
        tableView.register(nibName, forCellReuseIdentifier: "freeBoardCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.boardNameLabel.text = text
        self.setBoardLocation()
        setUpTableView()
        
        self.setWhatDataGet()
        
    }
    
    func setBoardLocation(){
        //게시판들이 섹션이 나누어져 있을 경우 해당 게시판 위치 text 설정하도록..
        boardLocationLabel.text = "Board > \(boardNameLabel.text ?? "?")"
    }

    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        registerXib()
        tableView.separatorStyle = .none
    }

    
    func setWhatDataGet(){
        switch boardNameLabel.text{
        case "공지":
            dataGet = DummyData.sampleData0
        case "정보게시판":
            dataGet = DummyData.sampleData1
        case "자유게시판":
            dataGet = DummyData.sampleData2
        case "동아리 이모저모":
            dataGet = DummyData.sampleData3
        case "Activity":
            dataGet = DummyData.sampleData4
        default:
            dataGet = DummyData.sampleData0
            break
            
        }
    }
    
    @IBAction func moveToTop(_ sender: UIButton) {
        tableView.setContentOffset(CGPoint.zero, animated: true)
    }
}

    


// MARK: - UITableViewDataSource

extension FreeBoardViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataGet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "freeBoardCell", for: indexPath) as! FreeBoardXibViewCell
        
        cell.titleLabel.text = dataGet[indexPath.row].title
        cell.nameLabel.text = dataGet[indexPath.row].writer
        cell.dateLabel.text = dataGet[indexPath.row].date
        cell.seenNumLabel.text = String(dataGet[indexPath.row].seenNum)
        cell.commentNumLabel.text = String(dataGet[indexPath.row].commentNum)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bulletinBoardDetailStoryboard = UIStoryboard(name: "BulletinBoardDetailView", bundle: nil)
        guard let bulletinBoardDetailViewController = bulletinBoardDetailStoryboard.instantiateViewController(withIdentifier: "BulletinBoardDetailVC") as? BulletinBoardDetailController else { return }
        
        bulletinBoardDetailViewController.boardName = text
        bulletinBoardDetailViewController.postTitle = dataGet[indexPath.row].title
        bulletinBoardDetailViewController.author = dataGet[indexPath.row].writer
        bulletinBoardDetailViewController.contents = dataGet[indexPath.row].contents
        bulletinBoardDetailViewController.createdAt = dataGet[indexPath.row].date
        
        self.navigationController?.pushViewController(bulletinBoardDetailViewController, animated: true)
    }
}
