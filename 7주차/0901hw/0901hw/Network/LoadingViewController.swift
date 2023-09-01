//
//  LoadingViewController.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

class LoadingViewController: UIViewController {
    
    
    var session: URLSession!
    
    var total: Double = 0   // "Content-Length"
    
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            
            if total != 0 {
                progressLabel.text = "\(result * 100)%"
            }
        }
    }
    
    let progressLabel = {
        let view = UILabel()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buffer = Data() // 빈 Data 타입으로 초기화
        
        /* ============ 기본 디자인 ============ */
        view.backgroundColor = .white
        view.addSubview(progressLabel)
        view.addSubview(imageView)
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view).inset(50)
            make.width.equalTo(imageView.snp.height)
        }
        
        /* ============ 네트워크 통신 ============ */
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        session = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: .main
        )
        
        session.dataTask(with: url!).resume()
        
    }
}

extension LoadingViewController: URLSessionDataDelegate {
    
    // 서버에서 최초로 응답 받은 경우
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("RESPONSE : ", response)
        
        if let response = response as? HTTPURLResponse,
           (200...500).contains(response.statusCode) {
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!
            
            return .allow
        }
        else {
            return .cancel
        }
    }
    
    // 서버에서 데이터 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DATA : ", data)
        
        buffer?.append(data)
    }
    
    // 서버에서 응답 완료된 후 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("END")
        
        if let error {
            print(error)
        }
        else {
            guard let buffer = buffer else {
                print(error)
                return
            }
            
            // 네트워크 통신은 기본적으로 background 에서 돌고, UI 는 메인에서 작업해주어야 한다
            // 여기선 session 초기화할 때, .main으로 했기 때문에 에러 x
            imageView.image = UIImage(data: buffer)
        }
    }
}
