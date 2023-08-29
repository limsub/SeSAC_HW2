//
//  BaseView.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigure() { }
    func setConstraints() { }
}
