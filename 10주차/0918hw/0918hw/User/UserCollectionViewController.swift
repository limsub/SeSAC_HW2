//
//  UserCollectionViewController.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import UIKit
import SnapKit


class UserCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first
        case second
    }
    
    var viewModel = UserCollectionViewModel()
    var dataSource: UICollectionViewDiffableDataSource<Section, User>!
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout() )
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 세팅
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        collectionView.delegate = self
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        
        // data 세팅
        configureDataSource()
        updateSnapshot()
        viewModel.list.bind { _ in
            self.updateSnapshot()
        }
        
        // 테스트
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.append()
        }
    }
    
    
    // 레이아웃
    static func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .lightGray
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    
    // cell Registration + dataSource
    func configureDataSource() {
        
        // cell Registration
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User> { cell, indexPath, itemIdentifier in
            // list content configuration
            var contentConfig = UIListContentConfiguration.valueCell()
            contentConfig.text = itemIdentifier.name
            contentConfig.secondaryText = String(itemIdentifier.age)
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.cornerRadius = 20
            backgroundConfig.backgroundColor = .gray
            
            cell.contentConfiguration = contentConfig
            cell.backgroundConfiguration = backgroundConfig
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
    
    
    // snapshot
    func updateSnapshot() {
        
        // snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(viewModel.list.value, toSection: Section.first)
        
        // apply
        dataSource.apply(snapshot)
    }
}


extension UserCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        
        
        viewModel.removeUser(index: indexPath.item)
    }
    
}

extension UserCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertuser(name: searchBar.text!)
    }
    
}
