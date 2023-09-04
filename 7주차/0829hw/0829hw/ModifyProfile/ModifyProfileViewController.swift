//
//  ModifyProfileViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit


// 1.
protocol PassDataDelegate {
    func receiveData(data: String)
}


class ModifyProfileViewController: BaseViewController {
    
    let mainView = ModifyProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "프로필 편집"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // 1.
        NotificationCenter.default.addObserver(self, selector: #selector(newIntroduction), name: NSNotification.Name("introduction"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name("introduction"),
            object: nil
        )
    }
    
    @objc
    func newIntroduction(notification: NSNotification) {
        print("add Observer 실행")
        if let intro = notification.userInfo?["new intro"] as? String {
            mainView.introButton.setTitle(intro, for: .normal)
        }
    }
    
    override func setConfigure() {
        super.setConfigure()
        mainView.nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        mainView.userNameButton.addTarget(self, action: #selector(userNameButtonClicked), for: .touchUpInside)
        mainView.introButton.addTarget(self, action: #selector(introButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func nameButtonClicked() {
        print("hi name")
        let vc = NameViewController()
        // 5.
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func userNameButtonClicked() {
        print("hi username")
        let vc = UserNameViewController()
        // 3.
        vc.completionHandler = { str in
            self.mainView.userNameButton.setTitle(str, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func introButtonClicked() {
        print("hi intro")
        
//        /* 정바향 값전달 테스트 */
//        NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: "sendDataForward"),
//            object: nil,
//            userInfo: ["forward Data": "this is forward"]
//        )
        
        // 1.
        NotificationCenter.default.addObserver(self, selector: #selector(newIntroduction), name: NSNotification.Name("introduction"), object: nil)
        
        
        let vc = IntroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


// 4.
extension ModifyProfileViewController: PassDataDelegate {
    func receiveData(data: String) {
        mainView.nameButton.setTitle(data, for: .normal)
    }
}
