//
//  MainViewController.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let label = {
        let label = UILabel()
        label.text = "메인화면입니다!"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let button = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }

        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalTo(view)
        }
        
        button.addTarget(self, action: #selector(logoutSuccess), for: .touchUpInside)
    }
    
    @objc
    func logoutSuccess() {
        
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let vc = OnboardingViewController()
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    

}
