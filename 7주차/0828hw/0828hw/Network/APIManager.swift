//
//  APIManager.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import Alamofire


class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    let header: HTTPHeaders = ["Authorization" : APIKey.tmdb]
    

    
    func callMovies(completionHandler: @escaping (MovieList) -> Void ) {
        let url = Endpoint.movieTrend.requestURL
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseDecodable(of: MovieList.self) { response in
                
                let statusCode = response.response?.statusCode ?? 500
                
                if (statusCode == 200 ) {
                    guard let value = response.value else { return }
                    completionHandler(value)
                }
                else {
                    print("Error! StatusCode : \(statusCode)")
                    print(response)
                }
            }
    }
    
    
    func callGenres(completionHandler: @escaping (GenreList) -> Void ) {
        let url = Endpoint.movieGenre.requestURL
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseDecodable(of: GenreList.self) { response in
                
                let statusCode = response.response?.statusCode ?? 500
                
                if (statusCode == 200 ) {
                    guard let value = response.value else { return }
                    completionHandler(value)
                }
                else {
                    print("Error! StatusCode : \(statusCode)")
                    print(response)
                }
            }

    }
    
    
    
    func callDetails(_ movieId: Int, completionHandler: @escaping (MovieDetail) -> Void ) {
        
        let url = Endpoint.movieDetail.requestURL + "\(movieId)/credits"
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseDecodable(of: MovieDetail.self) { response in
                
                let statusCode = response.response?.statusCode ?? 500
                
                if (statusCode == 200 ) {
                    guard let value = response.value else { return }
                    completionHandler(value)
                }
                else {
                    print("Error! StatusCode : \(statusCode)")
                    print(response)
                }
            }
        
    }

}
