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
        
        view.backgroundColor = .systemGray6
        
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
        label.numberOfLines = 0
        
        // 위쪽 정렬 어떻게 하냐
//        label.contentMode = .top
//        
//        label.layer.borderColor = UIColor.black.cgColor
//        label.layer.borderWidth = 1
        
        return label
    }()
    
    
    override func setConfigure() {
        super.setConfigure()
        
        contentView.backgroundColor = .lightGray
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.horizontalEdges.equalTo(contentView).inset(30)
            make.height.equalTo(imageView.snp.width).multipliedBy(1.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(contentView).inset(5)
            make.height.equalTo(20)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(contentView).inset(5)
            
            make.bottom.lessThanOrEqualTo(contentView).inset(5)
        }
    }
}
