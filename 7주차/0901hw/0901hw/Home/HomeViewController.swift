//
//  HomeViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    let button1 = {
        let button = UIButton()
        
        button.backgroundColor = .lightGray
        button.setTitle("버튼 1", for: .normal)
        
        return button
    }()
    let button2 = {
        let button = UIButton()
        
        button.backgroundColor = .lightGray
        button.setTitle("버튼 2", for: .normal)
        
        return button
    }()
    
    
    override func setConfigure() {
        super.setConfigure()
        
        view.addSubview(button1)
        view.addSubview(button2)
        
        button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        button1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(50)
        }
        button2.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom).offset(100)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(50)
        }
    }
    
    @objc
    func button1Clicked() {
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func button2Clicked() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
