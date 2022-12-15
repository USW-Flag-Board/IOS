//
//  BulletinBoardCommentCell.swift
//  FlagBoard
//
//  Created by 신승재 on 2022/11/19.
//

import UIKit

class BulletinBoardCommentCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
