//
//  SearchViewController.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit

class SearchViewController: BaseViewController {
    
    // 인스턴스 (서치바, 테이블뷰(lazy var))
    let searchBar = {
        let bar = UISearchBar()
        
        bar.placeholder = "검색어를 입력하세요"
        
        return bar
    }()
    
    lazy var tableView = {
        let view = UITableView()
        
        // register
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        
        // protocol
        view.delegate = self;
        view.dataSource = self;
        
        // rowHeight
        view.rowHeight = 150
        
        return view
    }()
    
    
    
    // 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // set
    override func setConfigure() {
        super.setConfigure()
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    override func setConstraints() {
        super.setConstraints()
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view)
        }
    }
}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier) as? SearchTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
