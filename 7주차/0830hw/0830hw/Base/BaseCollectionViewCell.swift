//
//  BaseCollectionViewCell.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit
import SnapKit

// collectionViewCell
// init / required init / setConfigure / setConstraints

class BaseCollectionViewCell: UICollectionViewCell {
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
