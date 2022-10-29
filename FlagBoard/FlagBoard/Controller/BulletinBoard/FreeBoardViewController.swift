//
//  FreeBoardViewController.swift
//  FlagBoard
//
//  Created by 송지연 on 2022/10/29.
//

import UIKit

class FreeBoardViewController: UIViewController {

    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var whatBoardLabel: UILabel!
    @IBOutlet weak var freeBoardTableView: UITableView!
    
    struct Model {
        let title: String
        let writer: String
        let date: String
        let seenNum: Int
        let commentNum: Int
        
        init(title: String, writer: String, date: String, seenNum: Int, commentNum: Int){
            self.title = title
            self.writer = writer
            self.date = date
            self.seenNum = seenNum
            self.commentNum = commentNum
        }
    }
    
    let dummyData = Model(title: "처음 뵙겠습니다.", writer: "홍길동", date: "2022.10.29", seenNum: 254, commentNum: 3)
    
    
    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "FreeBoardXibViewCell", bundle: nil)
        
        freeBoardTableView.register(nibName, forCellReuseIdentifier: "freeBoardCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setUpTableView(){
        
    }

}
