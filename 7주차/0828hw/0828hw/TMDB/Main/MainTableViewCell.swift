//
//  MainTableViewCell.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit

class MainTableViewCell: BaseTableViewCell {
    
    var posterImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    var dateLabel = makeLabel()
    var voteLabel = makeLabel()
    var titleLabel = makeLabel()
    var subtitleLabel = makeLabel()
    
    var lineView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var detailLabel = {
        let label = UILabel()
        
        label.text = "자세히 보기"
        label.textColor = .black
        
        return label
    }()
    
    var nextButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        
        return button
    }()
    
    static func makeLabel() -> UILabel {
        let label = UILabel()
        
        label.backgroundColor = .white
        label.textColor = .black
        
        return label
    }
    
    
    
    
    
    
    
    
    override func setConfigure() {
        super.setConfigure()
        
        [posterImageView, dateLabel, voteLabel, titleLabel, subtitleLabel, lineView, detailLabel, nextButton].forEach { item in
            contentView.addSubview(item)
        }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        dateLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(8)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).inset(8)
            make.horizontalEdges.equalTo(contentView).inset(8)
            make.height.equalTo(contentView).multipliedBy(0.6)
        }
        
        voteLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(posterImageView).inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8)
            make.leading.equalTo(contentView).inset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8)
            make.trailing.equalTo(contentView).inset(8)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(8)
            make.height.equalTo(1)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView).offset(10)
            make.leading.equalTo(contentView).offset(8)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(lineView).offset(10)
            make.trailing.equalTo(contentView).inset(8)
        }
        
        
        
    }
}
