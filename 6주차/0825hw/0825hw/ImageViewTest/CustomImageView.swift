//
//  CustomImageView.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit


class CustomImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConfigure() {
        
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
        
        print("현재 함수 setConfigure, frame.width : ", frame.width)
        
//        layer.cornerRadius = frame.width / 2
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        print("layoutSubView", frame.width, frame)
        print("현재 함수 layoutSubivews, frame.width : ", frame.width)
        
        // 레이아웃을 잡고난 이후에 frame 값이 바뀔 가능성이 있기 때문에 여기다가 써준다
        layer.cornerRadius = frame.width / 2
    }
}
