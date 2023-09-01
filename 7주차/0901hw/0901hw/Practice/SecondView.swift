//
//  SecondView.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit


// collectionView의 프로토콜 채택 후 함수 정의를 어디서 할거냐
// 즉, collectionView.delegate / datasource를 View로 할지 ViewController로 할지
// First : View / Second : ViewController
// 보통 실질적인 데이터는 view가 아닌 viewController에서 담고 있기 때문에
// 정적인 데이터일 때는 view에서 cell 관련 함수를 정의해도 되지만,
// 서버 통신 등 동적인 데이터는 viewController에서 함수를 정의하는 방법이 더 적절하다


class SecondView: BaseView {
    
    // 셀 선택 시 기능을 위한 프로토콜이기 때문에 Second case에서는 굳이 필요가 없어 보인다
//    var delegate: SecondSendDataProtocol?
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        view.register(PracticeCollectionViewCell.self, forCellWithReuseIdentifier: "PracticeCollectionViewCell")
        
        return view
    }()
    
    deinit {
        print("Second 뷰 deinit")
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
