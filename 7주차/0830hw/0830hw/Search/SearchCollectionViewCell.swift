//
//  SearchCollectionViewCell.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// collectionViewCell
// cell 내에 있는 인스턴스 / contentView.addSubview / snp layout

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(5)
        }
    }
}
