//
//  BulletinBoardSelectionTableViewCell.swift
//  FlagBoard
//
//  Created by 송지연 on 2022/10/11.
//

import UIKit

class BulletinBoardSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var boardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
