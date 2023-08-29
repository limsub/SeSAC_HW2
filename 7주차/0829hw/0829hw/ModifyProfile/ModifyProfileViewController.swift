//
//  ModifyProfileViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit


class ModifyProfileViewController: BaseViewController {
    
    let mainView = ModifyProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "프로필 편집"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func setConfigure() {
        mainView.nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        mainView.userNameButton.addTarget(self, action: #selector(userNameButtonClicked), for: .touchUpInside)
        mainView.introButton.addTarget(self, action: #selector(introButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func nameButtonClicked() {
        print("hi name")
        let vc = NameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func userNameButtonClicked() {
        print("hi username")
        let vc = UserNameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func introButtonClicked() {
        print("hi intro")
        let vc = IntroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
