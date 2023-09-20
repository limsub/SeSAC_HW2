//
//  SeSACAPI.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation
import Alamofire

enum SeSACAPI {
      // key는 항상 동일하다
      private static let key = "tHisIsunsPlaShKey"
    
      // 1, 2, 3 케이스를 나눈다
      // 필요한 추가 파라미터는 열거형의 연관값을 이용한다
      case search(query: String)
      case random
      case photo(id: String)
    
      // url
      var baseURL: String {
          return  "https://api.unsplash.com/"
      }
      var endpoint: URL {
          switch self {
          case .search:
              return URL(string: baseURL + "search/photos")!
          case .random:
              return URL(string: baseURL + "photos/random")!
          case .photo(let id):
              return URL(string: baseURL + "photos/\(id)")!
          }
      }
    
      // header
      var header: HTTPHeaders {
          return ["Authorization" : "Client-ID \(SeSACAPI.key)"]
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
  }
