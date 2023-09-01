//
//  BaseView.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit
import SnapKit

// BaseView
// init / required init / set

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
