//
//  BeerViewController.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import UIKit


class BeerViewController: UIViewController {
    
    let viewModel = BeerViewModel()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, BeerElement>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        configureHierarchy()
        configureLayout()
        configureDataSource()
        
        viewModel.request(api: .beers)
        
        viewModel.beers.bind { _ in
            self.apply()
        }
        
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    static func configureCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 120)
        layout.scrollDirection = .vertical
        return layout
    }
    
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<BeerCollectionViewCell, BeerElement> { cell, indexPath, itemIdentifier in
            
//            cell.imageView.backgroundColor = .black
            
            cell.designCell(itemIdentifier)
        }
        
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
    
    func apply() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, BeerElement>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.beers.value, toSection: 0)
        dataSource.apply(snapshot)
    }
    
    
}
