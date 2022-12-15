//
//  BulletinBoardDetailController.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/11/19.
//

import UIKit

class BulletinBoardDetailController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var boardNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var boardName: String?
    var postTitle: String?
    var author: String?
    var contents: String?
    var createdAt: String?
    
    var dummyDataArray: [CommentData] = CommentData.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setAllLabels()

    }
    
    //MARK: Functions
    func setUpTableView(){
        registerXib()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 메서드 네이밍은 임시, 추후에 수정 예정
    func setAllLabels() {
        guard let boardName = boardName else { return }
        self.boardNameLabel.text = boardName
        guard let postTitle = postTitle else { return }
        self.titleLabel.text = postTitle
        guard let author = author else { return }
        self.authorLabel.text = author
        guard let contents = contents else { return }
        self.contentsLabel.text = contents
        guard let createdAt = createdAt else { return }
        self.createdAtLabel.text = createdAt
    }
    
    private func registerXib(){
        let nibName = UINib(nibName: "BulletinBoardCommentCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "commentCell")
    }
}

// MARK: - UITableViewDataSource
extension BulletinBoardDetailController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! BulletinBoardCommentCell
        
        cell.authorLabel.text = dummyDataArray[indexPath.row].author
        cell.contentsLabel.text = dummyDataArray[indexPath.row].contents
        cell.createAtLabel.text = dummyDataArray[indexPath.row].createAt
        
        return cell
    }
}
