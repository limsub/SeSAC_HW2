//
//  DetailView.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit

class DetailView: BaseView {
    
    let backImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(backImageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(20)
        }
    }
    
}
