//
//  NetworkViewController.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import UIKit


class NetworkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
        // 첫 번째
//        NetworkBasic.shared.request(query: "apple") { photo, error in
//            if let photo {
//                print("성공 : ", photo)
//            }
//            if let error {
//                print("실패 : ", error)
//            }
//        }
        
        
        // 매개변수 옵셔널 바인딩
//        NetworkBasic.shared.random { photo, error in
//            if let photo { print("성공 : ", photo)}
//            if let error { print("실패 : ", error)}
//        }
        
        // SeSAC 에러 enum
//        NetworkBasic.shared.random { response in
//            switch response {
//            case .success(let success):
//                dump(success)
//            case .failure(let failure):
//                print(failure.errorDescription)
//                print(failure.localizedDescription)
//                print(failure.failureReason)
//            }
//        }
        
        // 제네릭 타입
        Network.shared.request(type: Photo.self, api: .search(query: "apple")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
                print(failure.localizedDescription)
                print(failure.failureReason)
            }
        }
        
    }
}
