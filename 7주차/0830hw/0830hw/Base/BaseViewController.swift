//
//  BaseViewController.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit
import SnapKit

// viewCon
// viewDidLoad / setConfigure / setConstraints

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
