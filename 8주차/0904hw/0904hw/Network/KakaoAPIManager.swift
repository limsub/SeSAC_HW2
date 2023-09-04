//
//  KakaoAPIManager.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import UIKit

class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    private init() { }
    
    func callRequest(query: String, completionHandler: @escaping (Book?) -> Void ){
        
        // 1. 검색할 문자열
        guard let txt = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        // 2. url
        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(txt)")
        
//        var urlComponents = URLComponents(string: "https://dapi.kakao.com/v3/search/book?query=\(txt)")
        
//        let searchQuery = URLQueryItem(name: "query", value: "apple")
        
//        urlComponents?.queryItems?.append(searchQuery)
        
//        guard let url = urlComponents?.url else { return }

        // 3. url request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        // 4. header -> 잘 모름 이거 -> 이제 알아..
        request.addValue(APIKey.kakao, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            print(request.allHTTPHeaderFields)
            
            // 1. error
            if let error { completionHandler(nil); return;}
            
            // 2. response
            guard let response = response as? HTTPURLResponse,
                  (200...500).contains(response.statusCode) else {
                completionHandler(nil)
                return
            }
            
//            print(response.statusCode)
            
            // 3. data
            guard let data = data else { completionHandler(nil); return; }
            
            // do catch
            do {
                let result = try JSONDecoder().decode(Book.self, from: data)
                print("SUCCESS!");
//                print(result)
                completionHandler(result)
            }
            catch {
                print("ERROR: ", error)
                completionHandler(nil)
            }
            
        }.resume()
        
    }
}
