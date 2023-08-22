//
//  ButtonTestViewController.swift
//  0822hw
//
//  Created by 임승섭 on 2023/08/22.
//

import UIKit
import SnapKit

class ButtonTestViewController: UIViewController {
    
    let b1 = makeButton()
    let b2 = makeButton()
    let b3 = makeButton()
    
    static func makeButton() -> UIButton {
        
        let button = UIButton()
        
        button.setTitle("버튼입니다", for: .normal)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .blue
        button.titleLabel?.textColor = .red
        
        
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(b1)
        view.addSubview(b2)
        view.addSubview(b3)
        
        
        
        b1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
        b2.snp.makeConstraints { make in
            make.top.equalTo(b1.snp.bottom).offset(10)
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
        b3.snp.makeConstraints { make in
            make.top.equalTo(b2.snp.bottom).offset(10)
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
        
        
        b1.imageEdgeInsets = UIEdgeInsets(top: -60, left: 0, bottom: 0, right: -50)
        b1.titleEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: -50, right: 0)
        
            
        
        b1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped() {
        print("hi")
    }
    
    
    



}
