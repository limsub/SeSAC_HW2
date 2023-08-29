//
//  nameViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit

// 값 전달 : Delegate Pattern 이용

class NameViewController: BaseViewController {
    
    let mainView = NameView()
    
    // 2. 
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "이름"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonClicked))
    }
    
    
    // 3.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let txt = mainView.textField.text {
            delegate?.receiveData(data: txt)
        }
            
    }
    
    @objc
    func completeButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
