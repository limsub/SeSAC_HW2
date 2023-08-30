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
        
        /*실패*/
        // 1. plain으로 만들어도 안됨 (gray, tint 이런건 누가봐도 배경 있어서 그런가 터치 됨)
//        let button = UIButton(configuration: .plain())

        // 2.
//        button.backgroundColor = .clear
        
        
        /* 약간 성공 */
        // 1.
        // 얘는 최소 0.01 넘겨야 터치 가능 (0.1 x, 0.11 o)
        // 문제는 텍스트까지 다 안보여
//        button.layer.opacity = 0.011
        
        // 2.
        // 보이는거 굿. 0.001까지 터치 가능 (0.0005 x)
//        button.layer.backgroundColor = UIColor.white.cgColor.copy(alpha: 0.001)
        
        
        // 3.
        // 얘는 0.001까지 됨 -> 일단 지금까진 얘가 제일 비슷하다
//        button.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        
//        button.backgroundColor = .blue
//        button.backgroundColor = .clear
        

        
        

        
        button.setTitle(sender, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
//        button.backgroundColor = .blue
        
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
            make.top.equalTo(safeAreaLayoutGuide).offset(100)
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
        
//        nameButton.snp.makeConstraints { make in
//            make.top.equalTo(nameTitle.snp.top)
//            make.leading.equalTo(nameTitle.snp.trailing)
//            make.trailing.equalTo(self).inset(20)
////            make.width.equalTo(200)
//            make.height.equalTo(50)
//        }
        
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameButton.topAnchor.constraint(equalTo: nameTitle.topAnchor),
            nameButton.leadingAnchor.constraint(equalTo: nameTitle.trailingAnchor),
            nameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            nameButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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

