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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

 
}
