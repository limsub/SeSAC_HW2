//
//  EmojiExplorerViewController.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/15.
//

import UIKit


class EmojiExplorerViewController: UIViewController {
    
    // 섹션
    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        case first, second, third
        
        var description: String {
            switch self {
            case .first: return "first"
            case .second: return "second"
            case .third: return "third"
            }
        }
    }
    
    // 데이터 타입
    struct Item: Hashable {
        let title: String?
        let emoji: Emoji?
        let hasChildren: Bool
        
        init(title: String?, emoji: Emoji?, hasChildren: Bool) {
            self.title = title
            self.emoji = emoji
            self.hasChildren = hasChildren
        }
        
        private let identifier = UUID().uuidString
    }
    
    // ??
    var starredEmojis = Set<Item>()
    
    // collectionView
    var collectionView: UICollectionView!
    
    // dataSource
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension EmojiExplorerViewController {
    // 네비게이션 디자인
    func configureView() {
        navigationItem.title = "이모지 익스플로럴"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    // view 디자인
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout() )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    // 레이아웃
    func createLayout() -> UICollectionViewLayout {
        
        let secctionProvider = { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?  in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil;}
            
            let section: NSCollectionLayoutSection
            
            switch sectionKind {
            case .first:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 5
                )
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.28),
                    heightDimension: .fractionalHeight(0.28)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                
                
            case .second:
                section = NSCollectionLayoutSection.list(
                    using: .init(appearance: .sidebar),
                    layoutEnvironment: layoutEnvironment
                )
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,
                    leading: 10,
                    bottom: 0,
                    trailing: 10
                )
                
                
            case .third:
                var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
                
                configuration.leadingSwipeActionsConfigurationProvider = { [weak self] (indexPath) in
                    
                    if let self = self, let item = self.dataSource.itemIdentifier(for: indexPath) {
                        return self.leadingSwipeActionsConfigurationProvider(item)
                    }
                    
                    section = NSCollectionLayoutSection.list(
                        using: configuration,
                        layoutEnvironment: layoutEnvironment
                    )
                }
            }
            
            return section
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: secctionProvider)
    }
    
    
    
    
    
    
}
