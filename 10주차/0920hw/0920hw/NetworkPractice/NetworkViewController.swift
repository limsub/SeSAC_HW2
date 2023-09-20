//
//  NetworkViewController.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher


class NetworkViewController: UIViewController {
    
    let imageView = {
        let view = UIImageView()
        
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let viewModel = NetworkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        // 1.
//        viewModel.requestRandom { url in
//            self.imageView.kf.setImage(with: url)
//        }
        
        
        // 2.
//        viewModel.url.bind { url in
//            self.imageView.kf.setImage(with: url)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.viewModel.requestRandom()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.viewModel.requestRandom()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.viewModel.requestRandom()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            self.viewModel.requestRandom()
//        }
        
        
        // 3.
//        viewModel.data.bind { data in
//            print("hi")
//            let url = URL(string: "")!
//
//            self.imageView.kf.setImage(with: data)
//            self.imageView.kf.setImage(with: <#T##Source?#>)
//        }
        
        
        // 4.
        viewModel.url.bind { url in
            self.imageView.kf.setImage(with: url)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.doAction(.requestRandom)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.doAction(.requestRandom)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel.doAction(.requestRandom)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.viewModel.doAction(.requestRandom)
        }
        
        
/*        // 첫 번째
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
//        Network.shared.request(type: Photo.self, api: .search(query: "apple")) { response in
//            switch response {
//            case .success(let success):
//                dump(success)
//            case .failure(let failure):
//                print(failure.errorDescription)
//                print(failure.localizedDescription)
//                print(failure.failureReason)
//            }
//        }
        */
    }
    
}
