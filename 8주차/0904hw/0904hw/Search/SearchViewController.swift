//
//  SearchViewController.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit
import RealmSwift

class SearchViewController: BaseViewController {
    
    // 데이터
    var data: [Document] = []
    
    
    // 인스턴스 (서치바, 테이블뷰(lazy var))
    lazy var searchBar = {
        let bar = UISearchBar()
        
        bar.placeholder = "검색어를 입력하세요"
        bar.delegate = self;
        
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
        view.rowHeight = 170
        
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
    
    // 옵셔널 뜯어내고 문자열 리턴
    func makeTitle(_ title: String?) -> String {
        guard let txt = title, txt.count != 0 else { return "제목 없음" }
        return txt
    }
    func makeContent(_ authors: [String]?, _ price: Int?) -> String {
        guard let authors = authors, let price = price, authors.count != 0 else { return "내용 없음" }
        var authorString = ""
        authors.forEach { item in
            authorString += "\(item) "
        }

        return "작가 : \(authorString)\n가격 : \(price)"
    }
}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = makeTitle(data[indexPath.row].title)
        cell.contentLabel.text = makeContent(data[indexPath.row].authors, data[indexPath.row].price)
        
        
        // kingfisher 없이 이미지 다운로드
        let thumb = data[indexPath.row].thumbnail
        let url = URL(string: thumb!)
        DispatchQueue.global().async {
            
            if let url {
                let data = try! Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.posterImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        
        let title = makeTitle(data[indexPath.row].title)
        let contents = makeContent(data[indexPath.row].authors, data[indexPath.row].price)
        
        let task: BookTable
        if let imageURL = data[indexPath.row].thumbnail {
            task = BookTable(title: title, contents: contents, imageURL: imageURL)
        } else {
            task = BookTable(title: title, contents: contents, imageURL: "")
        }
        
        try! realm.write {
            realm.add(task)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text else { return }
        
        if (query == "") {
            tableView.reloadData()
        }
        else {
            KakaoAPIManager.shared.callRequest(query: query) { books in
                guard let books = books else {
                    print("ERROR")
                    return
                }
                
                DispatchQueue.main.async {
                    self.data = books.documents
                    self.tableView.reloadData()
                }
            }
        }
    }
}
