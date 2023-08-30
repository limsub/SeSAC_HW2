//
//  AddView.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// view
// 인스턴스 / addSubview / snp layout

class AddView: BaseView {
    
    let posterImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    let searchButton = {
        let button = UIButton()
            
        button.setTitle("이미지 버튼", for: .normal)
        button.backgroundColor = .green
        
        return button
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(posterImageView)
        addSubview(searchButton)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        posterImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(self).inset(20)
            make.height.equalTo(50)
        }
    }
    
}


