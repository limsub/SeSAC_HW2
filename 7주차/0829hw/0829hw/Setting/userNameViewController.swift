//
//  userNameViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

class UserNameViewController: BaseViewController {
    
    let mainView = UserNameView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "사용자 이름"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
