//
//  FirstViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit



class FirstViewController: BaseViewController {
    
    let mainView = FirstView()
    
    override func loadView() {
        self.view = mainView
        
        mainView.delegate = self
    }
    
    deinit {
        print("First 뷰컨 deinit")
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        
    }
}

extension FirstViewController: FirstSendDataProtocol {
    func receiveData(_ sender: String) {
        print(sender)
        navigationController?.popViewController(animated: true)
    }
}
