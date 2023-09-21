//
//  Network.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//


import Foundation
import Alamofire

class Network {
    
    // singleton
    static let shared = Network()
    private init() { }
    
    
    // request
    func requestConvertible<T: Decodable>(type: T.Type, api: Router, completionHandler: @escaping (Result<T, SeSACError>) -> Void) {
        
        AF.request(api).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
                
            case .failure(_):
                print("에러 발생")
                let statusCode = response.response?.statusCode ?? 500
                guard let error = SeSACError(rawValue: statusCode) else { return }
                
                completionHandler(.failure(error))
            }
        }
    }
}
