//
//  PhotoViewController.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {
    
    let tableView = UITableView()
    
    let viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        viewModel.fetchPhoto()
        
    }
}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        let data = viewModel.cellForRowsAt(at: indexPath)
        cell.textLabel?.text = data.id
        
        cell.imageView?.kf.setImage(with: URL(string: data.urls.thumb))
        
        return cell
    }
}
