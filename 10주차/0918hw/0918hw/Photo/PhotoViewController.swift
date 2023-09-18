//
//  PhotoViewController.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // viewModel, collectionView, dataSource 인스턴스
    var viewModel = PhotoViewModel()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 세팅
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        configureDataSource()
        
        
        // 뷰모델 접근
        viewModel.list.bind { _ in
            self.updateSnapshot()
        }
        
        
    }
    
    
    // create Layout
    static func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .lightGray
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    
    // cellRegistration + dataSource
    private func configureDataSource() {
        // cell Registration
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult> { cell, indexPath, itemIdentifier in
            // content config
            var contentConfig = UIListContentConfiguration.valueCell()
            contentConfig.text = "\(itemIdentifier.likes)"
            
            // background config
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try! Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    contentConfig.image = UIImage(data: data)
                    
                    cell.contentConfiguration = contentConfig
                    cell.backgroundConfiguration = backgroundConfig
                }
            }
        }
        
        // dataSource
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                let cell = collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: itemIdentifier
                )
                return cell
            }
        )
        
    }
    
    // update snapshot
    private func updateSnapshot() {
        
        // snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value.results!)
        
        
        // apply
        dataSource.apply(snapshot)
    }
}

extension PhotoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchPhoto(text: searchBar.text!)
    }
}
