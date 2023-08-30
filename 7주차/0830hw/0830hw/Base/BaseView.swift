//
//  BaseView.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit
import SnapKit

// view
// init(frame:) / required init(coder:) / setConfigure / setConstraints

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigure() {
        
    }
    
    func setConstraints() {
        
    }
}
