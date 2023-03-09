//
//  TextFieldExtension.swift
//  FlagBoard
//
//  Created by 신승재 on 2023/03/09.
//

import Foundation
import UIKit

extension UITextField {
    func setRegisterStyle(placeholder: String) {
        // 버튼 외곽 및 배경
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.clear
        
        // 여백
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        // 플레이스 홀더 및 텍스트 색상
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor: UIColor.white])
        self.textColor = UIColor.white
    }
}
