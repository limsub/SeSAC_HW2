//
//  SecondViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit
import SnapKit

// 1 -> 2 : Delegate pattern
// 2 -> 3 : closure

class SecondViewController: UIViewController {
    
    
    
    let button = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Next Page", for: .normal)
        return button
    }()
    
    let textfield  = {
        let label = UITextField()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let label = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    var completionHandler: ( (String) -> Void )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "second viewcontroller"
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(textfield)
        view.addSubview(label)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        textfield.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        
        button.addTarget(self, action: #selector(nextPageButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        completionHandler?(textfield.text!)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        print("second viewcontroller init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("second viewcontroller deinit")
    }
    
    
    
    
    @objc
    func nextPageButtonClicked() {
        let vc = ThirdViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}



extension SecondViewController: SendDataProtocol {
    func receiveText(_ text: String) {
        label.text = text
    }
}
