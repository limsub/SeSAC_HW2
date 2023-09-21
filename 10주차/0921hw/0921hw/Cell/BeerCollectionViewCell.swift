//
//  BeerCollectionViewCell.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import UIKit
import SnapKit
import Kingfisher

class BeerCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)

        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(5)
            make.height.equalTo(imageView.snp.width)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(5)
        }
    }
    
    func designCell(_ sender: BeerElement) {
        imageView.kf.setImage(with: URL(string:sender.imageURL))
        label.text = "\(sender.name)\n\(sender.firstBrewed)"
    }
}
