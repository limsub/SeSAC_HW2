//
//  Router.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import Foundation
import Alamofire

//https://api.punkapi.com/v2/beers
//https://api.punkapi.com/v2/beers/1
//https://api.punkapi.com/v2/beers/random

enum Router: URLRequestConvertible {
    
    // 종류
    case beers
    case single
    case random
    
    // url
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/beers")!
    }
    private var path: String {
        switch self {
        case .beers:
            return ""
        case .single:
            return "/1"
        case .random:
            return "/random"
        }
    }
    
    // method
    var method: HTTPMethod {
        return .get
    }
    
    // urlrequest
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        
        request.method = method
        
        return request
    }
    
}
