//
//  Router.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private static let key = "ydZ0jSB2_axjqfgjtB_r__tqQb4mep9p-SFq8P5Ru0I"
    
    case search(query: String)
    case random
    case photo(id: String)
    
    // url
    private var baseURL: URL {
        return  URL(string: "https://api.unsplash.com/")!
    }
    private var path: String {
        switch self {
        case .search:
            return "search/photos"
        case .random:
            return "photos/random"
        case .photo(let id):
            return "photos/\(id)"
        }
    }
    
    // header
    private var header: HTTPHeaders {
        return ["Authorization" : "Client-ID \(Router.key)"]
    }
  
    // method
    var method: HTTPMethod {
        return .get
    }
  
    // query
    var query: [String: String] {
        switch self {
        case .search(let query):
            return ["query": query]
        case .random, .photo:
            return ["": ""]
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.headers = header
        request.method = method
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
    }
}
