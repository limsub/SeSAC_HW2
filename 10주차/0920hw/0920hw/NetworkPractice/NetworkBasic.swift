//
//  NetworkBasic.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation
import Alamofire

final class NetworkBasic {
    
    static let shared = NetworkBasic()
    private init() { }
    
    func request(query: String, completionHandler: @escaping (Result<Photo, SeSACError>) -> Void) {
        
        let api = SeSACAPI.search(query: query)
        
        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header)
            .responseDecodable(of: Photo.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    
                    completionHandler(.failure(error))
                }
            }
    }
        
    func random(completionHandler: @escaping (Result<PhotoResult, SeSACError>) -> Void) {
        
        let api = SeSACAPI.random
        
        AF.request(api.endpoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    
                    completionHandler(.failure(error))
                }
            }
    }
        
    func detailPhoto(id: String, completionHandler: @escaping (Result<PhotoResult, SeSACError>) -> Void) {
        
        let api = SeSACAPI.photo(id: id)
        
        AF.request(api.endpoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    
                    completionHandler(.failure(error))
                }
            }
    }
    
}
