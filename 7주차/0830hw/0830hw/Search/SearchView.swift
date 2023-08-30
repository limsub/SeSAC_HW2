//
//  SearchView.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// view
// 인스턴스 (lazy var collectionView) / addSubview / snp layout

class SearchView: BaseView {
    
    let searchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "검색어를 입력해주세요"
        
        return searchBar
    }()
    
    lazy var collectionView = {
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size / 4, height: size / 4)
        
        return layout
    }
    
}
