//
//  TextFieldExtension.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/03/09.
//

import Foundation
import UIKit

extension UIButton {
    func setCornerRound() {
        self.layer.cornerRadius = 20
    }
    
    func setButtonEnable(to: Bool) {
        if to {
            self.isEnabled = true
            self.backgroundColor = #colorLiteral(red: 0.2156939507, green: 0.5384917259, blue: 0.4589682817, alpha: 1)
        } else {
            self.isEnabled = false
            self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.5568627715, blue: 0.5568627119, alpha: 1)
        }
    }
}
