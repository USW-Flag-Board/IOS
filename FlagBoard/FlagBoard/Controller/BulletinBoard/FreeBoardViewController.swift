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
    
    

    
    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "FreeBoardXibViewCell", bundle: nil)
        
        freeBoardTableView.register(nibName, forCellReuseIdentifier: "freeBoardCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
    

    func setUpTableView(){
        freeBoardTableView.delegate = self
        freeBoardTableView.dataSource = self
        registerXib()
        freeBoardTableView.separatorStyle = .none
    }

}

extension FreeBoardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = freeBoardTableView.dequeueReusableCell(withIdentifier: "freeBoardCell", for: indexPath) as! FreeBoardXibViewCell
        
        cell.titleLabel.text = sampleData[indexPath.row].title
        cell.nameLabel.text = sampleData[indexPath.row].writer
        cell.dateLabel.text = sampleData[indexPath.row].date
        cell.seenNumLabel.text = sampleData[indexPath.row].seenNum
        cell.commentNumLabel.text = sampleData[indexPath.row].commentNum
        
        return cell
    }
    
    
}
