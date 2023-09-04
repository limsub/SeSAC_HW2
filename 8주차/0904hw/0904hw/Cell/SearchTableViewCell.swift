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
            make.leading.equalTo(posterImageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView).inset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(posterImageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView).inset(5)
        }
    }
    
}
