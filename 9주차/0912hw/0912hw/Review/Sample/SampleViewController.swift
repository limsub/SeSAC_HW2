//
//  SampleViewController.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import UIKit
import SnapKit

class SampleViewController: UIViewController {
    
    let tableView = UITableView()
    
    // viewModel
    var viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        let data = viewModel.cellForRowAt(at: indexPath)
        
        cell.textLabel?.text = data.introduce
        
        return cell
    }
}
