//
//  Test2ViewController.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//

import UIKit

class Test2ViewController: UIViewController {
    
    let button = {
       let button = UIButton()
        
        button.backgroundColor = .systemPink
        
        
        
        return button
    }()
    
     


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "네비게이션 타이틀"
        

        view.backgroundColor = .blue
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    

    @objc
    func buttonClicked() {
        
        let vc = Test3ViewController()
        
//        vc.modalPresentationStyle = .fullScreen
        
//        let nav = UINavigationController(rootViewController: vc)
        
//        present(nav, animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
