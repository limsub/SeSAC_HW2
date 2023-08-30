//
//  SearchViewController.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit
import Kingfisher

// viewCon
// mainView, loadView / collectionView self, func (protocol) /

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    var photoSet: [Result]?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnsplashAPIManager.shared.callImages("sky") { item in
            self.photoSet = item.results
            self.mainView.collectionView.reloadData()
        }
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        
        mainView.searchBar.delegate = self
        mainView.searchBar.becomeFirstResponder()
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    
    override func setConstraints() {
        super.setConstraints()
        
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let cnt = photoSet?.count {
            return cnt
        }
        else { return 0 }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        if let url = photoSet?[indexPath.row].urls.raw {
            cell.imageView.kf.setImage(with: URL(string: url))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let txt = photoSet?[indexPath.row].urls.raw {
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: "poster"),
                object: nil,
                userInfo: ["new image": txt]
            )
        }
        
        dismiss(animated: true)
    }
}


extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        mainView.searchBar.resignFirstResponder()
        
        if let txt = mainView.searchBar.text {
            UnsplashAPIManager.shared.callImages(txt) { item in
                self.photoSet = item.results
                self.mainView.collectionView.reloadData()
            }
        }
    }
}
