//
//  SimpleCollectionViewController.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/14.
//

import UIKit
import SnapKit

class SimpleCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 100
        case second = 200
    }
    
    let list1 = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
    ]
    let list2 = [
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20),
    ]
    
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var datasource: UICollectionViewDiffableDataSource<Section, User>!
    
//    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    static func layout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemPink
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        configureDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(list1, toSection: Section.second)
        snapshot.appendItems(list2, toSection: Section.first)
        
        datasource.apply(snapshot)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User> (handler: { cell, indexPath, itemIdentifier in
            
            // content configuration
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.age), \(indexPath.item)"
            content.image = UIImage(systemName: "star")
            
            content.textProperties.color = .brown
            content.secondaryTextProperties.alignment = .center
            content.imageProperties.tintColor = .red
            
            content.prefersSideBySideTextAndSecondaryText = true
            
            content.imageToTextPadding = 100
            
            
            // background configuration
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 80
            backgroundConfig.strokeColor = .cyan
            backgroundConfig.strokeWidth = 10
            
            
            // cell에 적용
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
        })
        
        datasource = UICollectionViewDiffableDataSource(
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
}
