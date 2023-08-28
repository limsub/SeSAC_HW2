//
//  MainTableViewCell.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit

class MainTableViewCell: BaseTableViewCell {
    
    let posterImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        contentView.addSubview(posterImageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(5)
        }
    }
}
