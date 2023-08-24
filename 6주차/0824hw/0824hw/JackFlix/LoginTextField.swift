//
//  LoginTextField.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//

import UIKit

class LoginTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpTextField()
    }
    
    
    convenience init(placeholer: String) {
        self.init()
        
//        placeholder = placeholer
        
        attributedPlaceholder = NSAttributedString(string: placeholer, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 13)])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpTextField() {
        clipsToBounds = true
        layer.cornerRadius = 10
    
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftViewMode = .always
        
        textColor = .white
        
        backgroundColor = .darkGray
    }
    
    
    // 플레이스홀더 색상 바꾸기
//    func setPlaceholderColor(_ placeholderColor: UIColor) {
//            attributedPlaceholder = NSAttributedString(
//                string: placeholder ?? "",
//                attributes: [
//                    .foregroundColor: placeholderColor,
//                    .font: font
//                ].compactMapValues { $0 }
//            )
//    }
}
