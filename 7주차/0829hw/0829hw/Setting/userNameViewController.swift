//
//  userNameViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

// 값 전달 : closure 이용

class UserNameViewController: BaseViewController {
    
    let mainView = UserNameView()
    
    // 1.
    var completionHandler: ((String) -> Void)?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "사용자 이름"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonClicked))
    }
    
    // 2.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let txt = mainView.textField.text {
            if (!txt.isEmpty) {
                completionHandler?(txt)
            }
        }
    }
    
    @objc
    func completeButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
