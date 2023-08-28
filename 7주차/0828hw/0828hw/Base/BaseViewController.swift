//
//  BaseViewController.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigure()
        setConstraints()
    }
    
    func setConfigure() {
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        
    }
}
