//
//  EmojiExplorerListViewController.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/14.
//

import UIKit


class EmojiExplorerListViewController: UIViewController {
    
    typealias Section = Emoji.Category
    
    struct Item: Hashable {
        let title: String
        let emoji: Emoji
        
        init(title: String, emoji: Emoji) {
            self.title = title
            self.emoji = emoji
        }
        
        private let identifier = UUID()
    }
    
    
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavItem()
        configureHierarchy()
        configureDataSource()
        applyInitialSnapshots()
    }
    
}


extension EmojiExplorerListViewController {
    
    func configureNavItem() {
        navigationItem.title = "이모지 익스플로러럴 - 리스트"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout() )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    
    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Emoji> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.text
            content.secondaryText = String(describing: itemIdentifier.category)
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.cornerRadius = 20
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
                
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier.emoji)
            }
        )
    }
    
    
    func applyInitialSnapshots() {
        
        for category in Emoji.Category.allCases.reversed() {
            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<Item>()
            
            let items = category.emojis.map{ Item(title: String(describing: category), emoji: $0) }
            
            sectionSnapshot.append(items)
            
            dataSource.apply(sectionSnapshot, to: category, animatingDifferences: false)
        }
    }
    
}

extension EmojiExplorerListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let emoji = self.dataSource.itemIdentifier(for: indexPath)?.emoji else {
            collectionView.deselectItem(at: indexPath, animated: true)
            return
        }
        
        let detailViewController = EmojiDetailViewController(with: emoji)
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}
