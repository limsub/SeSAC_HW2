//
//  introViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

// 값 전달 : NotificationCenter 이용

class IntroViewController: BaseViewController {
    
    let mainView = IntroView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "소개"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonClicked))
    }
    
    @objc
    func completeButtonClicked() {
        
        if let txt = mainView.textView.text {
            if (!txt.isEmpty) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "introduction"), object: nil, userInfo: ["new intro": txt])
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
