//
//  BaseTableViewCell.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConfigure() { }
    func setConstraints() { }
    
}
