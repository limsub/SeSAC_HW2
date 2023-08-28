//
//  Extension+URL.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import Foundation

extension URL {
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
}

enum Endpoint {
    case movieTrend
    case movieGenre
    case movieDetail
    case imagePrefix
    
    var requestURL: String {
        switch self {
        case .movieTrend:
            return URL.makeEndPointString("trending/movie/week?language=en-US")
        case .movieGenre:
            return URL.makeEndPointString("genre/movie/list")
        case .movieDetail:
            return URL.makeEndPointString("movie/") // + "\(movieID)/credits" 추가
        case .imagePrefix:
            return "https://image.tmdb.org/t/p/w500/"
            
        }
    }
}
