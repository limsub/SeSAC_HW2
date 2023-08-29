//
//  introViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

class IntroViewController: BaseViewController {
    
    let mainView = IntroView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "소개"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
