//
//  MainViewController.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit

class MainViewController: BaseViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.movieTableView.rowHeight = 200
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.movieTableView.delegate = self
        mainView.movieTableView.dataSource = self
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell")
                as? MainTableViewCell else { return UITableViewCell() }
        
        cell.posterImageView.image = UIImage(systemName: "pencil")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(DetailViewController(), animated: true)
    }
    
}
