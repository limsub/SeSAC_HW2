//
//  EmojiExplorerListViewController.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/14.
//

import UIKit


class EmojiExplorerListViewController: UIViewController {
    
    typealias Section = Emoji.Category  // (enum. CaseIterable)
    
    
    
    struct Item: Hashable {
        let title: String
        let emoji: Emoji    // (struct. text, title, category)
        
        init(title: String, emoji: Emoji) {
            self.title = title
            self.emoji = emoji
        }
        
        private let identifier = UUID()
    }
    
    
    
    
    var collectionView: UICollectionView!
    
    // Section -> 이모지 카테고리만큼 섹션 나누겠다
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
    
    // Layout
    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    
    func configureDataSource() {
        // 가지고 있는 데이터는 Item, 보여주는 형식은 Emoji?
        // (data) (present)
        
        // Present
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Emoji> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.text
            content.secondaryText = /*itemIdentifier.title*/String(describing: itemIdentifier.category)
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.cornerRadius = 20
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
            
        }
        
        // Data
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: itemIdentifier.emoji
                )
            }
        )
    }
    
    
    func applyInitialSnapshots() {
    
        for category in Emoji.Category.allCases.reversed() {    // 카테고리를 돌아.
            
            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<Item>()   // 섹션 스냅샷을 하나 만들어. 들어가는 타입은 Item
            
            // [Item] 타입으로 만드네
            
            // 카테고리를 돌면, 각각 case가 있고, 그 case의 emojis에 접근하면 [Emoji] 타입을 얻을 수 있고,
            // 그 배열을 돌면서 Emoji 타입을 통해 Item 타입을 만들고,
            // 그걸 map으로 빼서 배열을 만들어
            let items = category.emojis.map{ Item(title: /*$0.text*/String(describing: category), emoji: $0) }
            
            // 그럼 지금 [Item] 타입의 배열이 하나 있는데, 그걸 sectionSnapshot에다가 넣어
            sectionSnapshot.append(items)
            
            // 추가한 sectionSnapshot을 dataSource에 적용해
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
