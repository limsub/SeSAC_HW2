//
//  UnsplashAPIManager.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import Foundation
import Alamofire

class UnsplashAPIManager {
    
    static let shared = UnsplashAPIManager()
    private init() {}
    
    func callImages(_ term: String, completionHandler: @escaping (Photo) -> Void ) {
        
//        print("callImage 실행")
        
        // https://api.unsplash.com/search/photos?query=sky&client_id=ydZ0jSB2_axjqfgjtB_r__tqQb4mep9p-SFq8P5Ru0I
        //guard let txt = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let txt = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let url = "https://api.unsplash.com/search/photos?" + "query=\(txt)" + "&client_id=\(APIKey.unsplash)"
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: Photo.self) { response in
            let statusCode = response.response?.statusCode ?? 500
            
            print("statusCode : \(statusCode)")
            
            
            if (statusCode == 200) {
                
                print(response.value)
                // response.value가 nil이 나오네..? -> 일단 코더블로 받은 구조체 수정하는거밖에는 답이...
                
                guard let value = response.value else { return }
                completionHandler(value)
            }
            else {
                print("Error")
                print("statusCode: \(statusCode)")
                print("response : \(response)")
            }
        }
    }
}
