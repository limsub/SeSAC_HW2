//
//  SearchTableViewCell.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit

class SearchTableViewCell: BaseTableViewCell {
    
    let posterImageView = {
        let view = UIImageView()
        
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let titleLabel = {
        let label = UILabel()
        
        return label
    }()
    
    let contentLabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        
//        label.layer.borderColor = UIColor.black.cgColor
//        label.layer.borderWidth = 1
        
        label.contentMode = .topLeft
        
        return label
    }()
    
    
    override func setConfigure() {
        super.setConfigure()
        

        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        posterImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(contentView).inset(5)
            make.width.equalTo(posterImageView.snp.height).multipliedBy(0.7)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView)
            make.height.equalTo(20)
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).inset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).inset(5)
            make.bottom.greaterThanOrEqualTo(contentView).inset(5)
        }
    }
    
}
