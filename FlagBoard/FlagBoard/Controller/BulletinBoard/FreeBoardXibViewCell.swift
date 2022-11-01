//
//  FreeBoardXibViewCell.swift
//  FlagBoard
//
//  Created by 송지연 on 2022/10/29.
//

import UIKit

class FreeBoardXibViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seenNumLabel: UILabel!
    @IBOutlet weak var commentNumLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
