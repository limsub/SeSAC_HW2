//
//  userNameView.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

class UserNameView: BaseView {
    
    let label = {
        let view = UILabel()
        
        view.text = "사용자 이름"
        view.textColor = .lightGray
        view.font = .systemFont(ofSize: 12)
        
        return view
    }()
    
    let textField = {
        let view = UITextField()
        
        view.attributedPlaceholder = NSAttributedString(string: "사용자 이름을 입력하세요", attributes: [.foregroundColor: UIColor.systemGray2, .font: UIFont.systemFont(ofSize: 15)])
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
