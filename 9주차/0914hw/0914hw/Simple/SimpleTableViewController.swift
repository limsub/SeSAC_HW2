//
//  SimpleTableViewController.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/14.
//

import UIKit
import SnapKit

// tableView 만들기

class SimpleTableViewController: UIViewController {
    
    let list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SimpleTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = list[indexPath.row].name
        content.secondaryText = "\(list[indexPath.row].age)"
        content.image = UIImage(systemName: "pencil")
        
        content.imageToTextPadding = 100
        content.textToSecondaryTextVerticalPadding = 50
        
        content.textProperties.font = .systemFont(ofSize: 20)
        content.imageProperties.tintColor = .red
    
        cell.contentConfiguration = content
        
        return cell
    }
}
