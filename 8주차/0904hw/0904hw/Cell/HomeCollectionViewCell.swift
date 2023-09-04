//
//  HomeCollectionViewCell.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let titleLabel = {
        let label = UILabel()
        
        label.text = "타이틀 타이틀"
        
        return label
    }()
    
    let contentLabel = {
        let label = UILabel()
        
        label.text = "컨텐츠 컨텐츠"
        
        return label
    }()
    
    
    override func setConfigure() {
        super.setConfigure()
        
        contentView.backgroundColor = .darkGray
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(contentView).inset(5)
            make.width.equalTo(imageView.snp.height).multipliedBy(0.7)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView).inset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView).inset(5)
        }
    }
}
