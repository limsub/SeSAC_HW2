//
//  nameViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

class NameViewController: BaseViewController {
    
    let mainView = NameView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "이름"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
