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
        
//        /* 정방향 값전달 테스트 */
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(printData),
//            name: NSNotification.Name("sendDataForward"),
//            object: nil
//        )
    }
    
    @objc
    func printData(notification: NSNotification) {
        print("hi")
        if let data = notification.userInfo?["forward Data"] as? String {
            print(data)
        } else {
            print("NotificationCenter 정방향 값전달 실패. data = nil")
        }
    }

    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 2.
        if let txt = mainView.textView.text {
            if (!txt.isEmpty) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "introduction"), object: nil, userInfo: ["new intro": txt])
            }
        }
    }
    
    @objc
    func completeButtonClicked() {
        
//        /* 정바향 값전달 테스트 */
//        NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: "sendDataForward"),
//            object: nil,
//            userInfo: ["forward Data": "this is forward"]
//        )
        
        
        navigationController?.popViewController(animated: true)
    }
}
