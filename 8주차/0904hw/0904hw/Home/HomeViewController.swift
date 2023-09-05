//
//  HomeViewController.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit
import RealmSwift
import Kingfisher


class HomeViewController: BaseViewController {
    
    let realm = try! Realm()
    var tasks: Results<BookTable>!
    
    // 인스턴스 (컬렉션뷰)
    lazy var collectionView = {
        // 초기화할 때 주의 제발 매개변수
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        // register (identifier)
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        
        // protocol 연결
        view.delegate = self;
        view.dataSource = self;
        
        
        return view;
    }()
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tasks = realm.objects(BookTable.self).sorted(byKeyPath: "title", ascending: true)
        
        
        
        print(realm.configuration.fileURL?.standardizedFileURL)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(tasks)
        
        collectionView.reloadData()
    }
    
    
    // set  (라이트바버튼아이템)
    override func setConfigure() {
        super.setConfigure()
        
        title = "Book Warm Project"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        
        // 버튼 검정색이 안된다.. -> systemName으로 해야지 멍충아
//        navigationItem.rightBarButtonItem?.tintColor = .black
//        navigationController?.navigationBar.tintColor = .black
//        navigationItem.titleView?.tintColor = .black

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
        layout.itemSize = CGSize(width: size / 2, height: size / 2 + 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return layout
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let tasks {
            return tasks.count
        }
        else { return 0 }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }

        let data = tasks[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.contentLabel.text = data.contents
        cell.memoLabel.text = data.memo
        
        
        /* ========== 이미지 다운로드 ========== */
        // 9/4 kingFisher 이용
//        let imageURL = URL(string: data.imageURL)
//        cell.imageView.kf.setImage(with: imageURL)
        
        
        // 9/5 도큐먼트에 저장된 실제 이미지 파일 이용
        cell.imageView.image = loadImageFromDocument(fileName: "sub_\(tasks[indexPath.row]._id).jpg")
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hihi")
        
        let vc = DetailViewController()
        vc.data = tasks[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
