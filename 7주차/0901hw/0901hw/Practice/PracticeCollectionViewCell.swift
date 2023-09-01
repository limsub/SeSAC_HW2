//
//  PracticeCollectionViewCell.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

// collectionViewCell
// 인스턴스 / set (addSubview, snp layout)

class PracticeCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
    }
}
