//
//  AddViewController.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// viewCon
// mainview / loadView / addTarget / @objc func

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        
    }
    
    
    
    @objc
    func searchButtonClicked() {
        let vc = SearchViewController()
        
        present(vc, animated: true)
    }
}
