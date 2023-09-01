//
//  FirstView.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit
import SnapKit

// collectionView의 프로토콜 채택 후 함수 정의를 어디서 할거냐
// 즉, collectionView.delegate / datasource를 View로 할지 ViewController로 할지
// First : View / Second : ViewController
// 보통 실질적인 데이터는 view가 아닌 viewController에서 담고 있기 때문에
// 정적인 데이터일 때는 view에서 cell 관련 함수를 정의해도 되지만,
// 서버 통신 등 동적인 데이터는 viewController에서 함수를 정의하는 방법이 더 적절하다


/* First */
// View에서 프로토콜 채택
// weak 키워드가 필요한 delegate 활용 예시

// 1. weak을 붙이지 않았을 때
// 2. weak을 붙였을 때 (-> AnyObject까지)
// deinit으로 확인


class FirstView: BaseView {
    
    weak var delegate: FirstSendDataProtocol?
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        view.register(PracticeCollectionViewCell.self, forCellWithReuseIdentifier: "PracticeCollectionViewCell")
        
        // First
        view.delegate = self;
        view.dataSource = self;
        
        return view
    }()
    
    deinit {
        print("First 뷰 deinit")
    }
    
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(collectionView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        
        let size = UIScreen.main.bounds.width - 32
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: size / 3, height: size / 3)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return layout
    }
}

// First
extension FirstView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PracticeCollectionViewCell", for: indexPath) as? PracticeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // First
        // 셀을 선택했을 때, 화면 전환 기능을 추가하려 한다.
        // 하지만 navigation push, present는 viewController의 메서드이기 때문에 여기서 실행시킬 수가 없다
        // 그래서 delegate pattern을 이용해서 viewController 쪽에서 메서드가 실행되게 한다
        
        delegate?.receiveData("hi \(indexPath)")
    }
}
