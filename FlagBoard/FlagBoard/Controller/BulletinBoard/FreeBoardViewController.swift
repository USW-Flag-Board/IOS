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
        
        //self.setPageController()
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

//    func setPageController(){
//        if ((DummyData.sampleData.count % 11) == 0){
//            pageControl.numberOfPages = DummyData.sampleData.count / 11
//        }else {
//            pageControl.numberOfPages = DummyData.sampleData.count / 11 + 1
//        }
//    }
    
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
    
}

    


// MARK: - UITableViewDataSource

extension FreeBoardViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch boardNameLabel.text{
//        case "공지":
//            return DummyData.sampleData0.count
//        case "정보게시판":
//            return DummyData.sampleData1.count
//        case "자유게시판":
//            return DummyData.sampleData2.count
//        case "동아리 이모저모":
//            return DummyData.sampleData3.count
//        case "Activity":
//            return DummyData.sampleData4.count
//        default:
//            return 0
//
//        }
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
        
    }
}
