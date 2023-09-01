//
//  SecondViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

class SecondViewController: BaseViewController {
    
    let mainView = SecondView()
    
    override func loadView() {
        self.view = mainView
        
//        mainView.delegate = self
        
        // Second
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    
    deinit {
        print("Second 뷰컨 deinit")
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        
    }
}

extension SecondViewController: SecondSendDataProtocol {
    func receiveData(_ sender: String) {
        print(sender)
    }
}

// Second
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PracticeCollectionViewCell", for: indexPath) as? PracticeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        // Second
        // 셀을 선택했을 대, 화면 전환 기능을 추가하려 한다
        navigationController?.popViewController(animated: true)
    }
}

