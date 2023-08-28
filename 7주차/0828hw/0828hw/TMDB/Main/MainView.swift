//
//  MainView.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit

class MainView: BaseView {
    
    lazy var movieTableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        
        return tableView
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(movieTableView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.bottom.equalTo(self)
        }
    }
}
