//
//  introView.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

class IntroView: BaseView {
    
    let label = {
        let view = UILabel()
        
        view.text = "소개"
        view.textColor = .lightGray
        view.font = .systemFont(ofSize: 12)
        
        return view
    }()
    
    let textView = {
        let view = UITextView()
        
        view.text = "으아아"
        view.textColor = .white
        
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        
        view.backgroundColor = .black
        
        return view
    }()
    
    override func setConfigure() {
        [label, textView].forEach { item in
            addSubview(item)
        }
    }
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(self).offset(20)
        }
        textView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self).inset(20)
            make.height.equalTo(200)
        }
    }
}
