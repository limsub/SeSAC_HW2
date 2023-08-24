//
//  Test1ViewController.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//

import UIKit
import SnapKit

class Test1ViewController: UIViewController {
    
    
    let button = {
       let button = UIButton()
        
        button.backgroundColor = .systemPink
        
        
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    @objc
    func buttonClicked() {
        
        let vc = Test2ViewController()
        
//        let nav = UINavigationController(rootViewController: vc)
//
//        nav.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    



}
