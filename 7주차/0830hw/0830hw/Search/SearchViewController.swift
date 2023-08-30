//
//  SearchViewController.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// viewCon
// mainView, loadView / collectionView self, func (protocol) /

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    
    override func setConstraints() {
        super.setConstraints()
        
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("go")
    }
}
