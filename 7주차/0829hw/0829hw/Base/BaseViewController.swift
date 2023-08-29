//
//  BaseViewController.swift
//  0829hw
//
//  Created by 임승섭 on 2023/08/29.
//

import UIKit
import SnapKit


class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigure()
        setConstraints()
    }
    
    
    func setConfigure() { view.backgroundColor = .black }
    func setConstraints() { }
}
