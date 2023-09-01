//
//  SecondViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

class SecondViewController: BaseViewController {
    
    let mainView = SecondView()
    
    var list: Photo = Photo(total: 0, total_pages: 0, results: [])
    
    override func loadView() {
        self.view = mainView
        
//        mainView.delegate = self
    }
    
    override func viewDidLoad() {
        // Second
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        
        APIManagerClosure.shared.callRequest { photo in
            guard let photo = photo else {  // nil이 들어왔을 때 처리
                print("ERROR ALERT")
                return
            }
            
            print("API END")
            
            self.list = photo
            
            // (1). 여기서 main으로 돌리기
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
            
            
        }
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
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PracticeCollectionViewCell", for: indexPath) as? PracticeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .blue
        
        // 이미지 불러오기 by 링크 (네트워크 통신) (kingfisher x)
        let thumb = list.results[indexPath.item].urls.thumb
        let url = URL(string: thumb)
        
        // 네트워크 통신은 비동기도 돌려야 한다
        DispatchQueue.global().async {
            // 뭐가 네트워크 통신인거지..?
            
            
            let data = try! Data(contentsOf: url!)
            
            // 다시 UI는 메인에서 돌려준다
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        // Second
        // 셀을 선택했을 대, 화면 전환 기능을 추가하려 한다
        navigationController?.popViewController(animated: true)
    }
}

