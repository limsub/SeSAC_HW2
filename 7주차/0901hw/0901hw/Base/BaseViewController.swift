//
//  BaseViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit
import SnapKit

// BaseViewController
// viewDidLoad / set

class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigure()
        setConstraints()
    }
    
    func setConfigure() {
        view.backgroundColor = .white
    }
    func setConstraints() { }
}
