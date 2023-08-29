//
//  NameView.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

// 값 전달 : Delegate Pattern 이용

class NameView: BaseView {
    
    let label = {
        let view = UILabel()
        
        view.text = "이름"
        view.textColor = .lightGray
        view.font = .systemFont(ofSize: 12)
        
        return view
    }()
    
    let textField = {
        let view = UITextField()
        
        view.borderStyle = .none
        view.layer.addBorder([.bottom], color: .white, width: 2)
        
        view.attributedPlaceholder = NSAttributedString(string: "이름을 입력하세요", attributes: [.foregroundColor: UIColor.systemGray2, .font: UIFont.systemFont(ofSize: 15)])
        view.textColor = .white
        
        return view
    }()
    
    override func setConfigure() {
        [label, textField].forEach { item in
            addSubview(item)
        }
    }
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(self).offset(20)
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self).inset(20)
            make.height.equalTo(50)
        }
        
    }
}
