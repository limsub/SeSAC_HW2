//
//  HomeViewController.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // 인스턴스 (컬렉션뷰)
    lazy var collectionView = {
        // 초기화할 때 주의 제발 매개변수
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        // register (identifier)
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        
        // protocol 연결
        view.dataSource = self;
        view.dataSource = self;
        
        
        return view;
    }()
    
    
    
    
    
    // viewDidLoad
    
    
    // set  (라이트바버튼아이템)
    override func setConfigure() {
        super.setConfigure()
        
        
        
        title = "Book Warm Project"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        
        // 버튼 검정색이 안된다..
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.titleView?.tintColor = .black
        
        view.addSubview(collectionView)
    }
    
    @objc
    func searchButtonClicked() {
        let vc = SearchViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    
    // collectionViewLayoutFlow
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let size = UIScreen.main.bounds.width - 24
        layout.itemSize = CGSize(width: size / 2, height: size / 2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return layout
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
