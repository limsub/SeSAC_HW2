//
//  FirstViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit
import SnapKit

// 1 -> 2 : Delegate pattern
// 2 -> 3 : closure


class FirstViewController: UIViewController {
    
    let button = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Next Page", for: .normal)
        return button
    }()
    
    let label  = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "first viewcontroller"
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(label)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        
        button.addTarget(self, action: #selector(nextPageButtonClicked), for: .touchUpInside)
    }
    
    
    @objc
    func nextPageButtonClicked() {
        let vc = SecondViewController()
        vc.completionHandler = { txt in
            self.label.text = txt
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

