//
//  ModifyProfileView.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit


class ModifyProfileView: BaseView {
    
    static func makeTitle(_ sender: String) -> UILabel {
        let label = UILabel()
        
        label.text = sender
        label.textColor = .white
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        
        return label
    }
    
    static func makeButton(_ sender: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(sender, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        
        return button
    }
    
    
    let nameTitle = makeTitle("이름")
    let userNameTitle = makeTitle("사용자 이름")
    let introTitle = makeTitle("소개")
    
    let nameButton = makeButton("이름")
    let userNameButton = makeButton("사용자 이름")
    let introButton = makeButton("소개")
    
    override func setConfigure() {
        [nameTitle, userNameTitle, introTitle, nameButton, userNameButton, introButton].forEach { item in
            addSubview(item)
        }
    }
    
    
    override func setConstraints() {
        nameTitle.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(100)
            make.leading.equalTo(self).offset(20)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        userNameTitle.snp.makeConstraints { make in
            make.top.equalTo(nameTitle.snp.bottom)
            make.leading.equalTo(nameTitle)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        introTitle.snp.makeConstraints { make in
            make.top.equalTo(userNameTitle.snp.bottom)
            make.leading.equalTo(nameTitle)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        nameButton.snp.makeConstraints { make in
            make.top.equalTo(nameTitle)
            make.leading.equalTo(nameTitle.snp.trailing)
            make.trailing.equalTo(self).inset(20)
            make.height.equalTo(50)
        }
        userNameButton.snp.makeConstraints { make in
            make.top.equalTo(userNameTitle)
            make.leading.equalTo(userNameTitle.snp.trailing)
            make.trailing.equalTo(self).inset(20)
            make.height.equalTo(50)
        }
        introButton.snp.makeConstraints { make in
            make.top.equalTo(introTitle)
            make.leading.equalTo(introTitle.snp.trailing)
            make.trailing.equalTo(self).inset(20)
            make.height.equalTo(50)
        }
        
        
    }
}

