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
    @IBOutlet weak var tableView: UITableView!
    
    private func registerXib(){
        
        //tableView에 cell 등록
        let nibName = UINib(nibName: "FreeBoardXibViewCell", bundle: nil)
        
        tableView.register(nibName, forCellReuseIdentifier: "freeBoardCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    

    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        registerXib()
        tableView.separatorStyle = .none
    }

}


// MARK: - UITableViewDataSource
extension FreeBoardViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "freeBoardCell", for: indexPath) as! FreeBoardXibViewCell
        
        cell.titleLabel.text = DummyData.sampleData[indexPath.row].title
        cell.nameLabel.text = DummyData.sampleData[indexPath.row].writer
        cell.dateLabel.text = DummyData.sampleData[indexPath.row].date
        cell.seenNumLabel.text = String(DummyData.sampleData[indexPath.row].seenNum)
        cell.commentNumLabel.text = String(DummyData.sampleData[indexPath.row].commentNum)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
