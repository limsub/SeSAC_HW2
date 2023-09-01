//
//  APIManagerClosure.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import UIKit

class APIManagerClosure {
    
    static let shared = APIManagerClosure()
    private init() { }
    
    func callRequest(completionHandler: @escaping (Photo?) -> Void) {   // 문제가 생겼을 때 completionHandler의 인자로 nil을 넣어준다 -> 예외처리
        
        let url = URL(string: "https://api.unsplash.com/search/photos?" + "query=sky" + "&client_id=\(APIKey.unsplash)")
        
        var request = URLRequest(url: url!, timeoutInterval: 10)  // timeout 디폴트 60초
        
        
        // 네트워크 통신은 자동으로 global 쓰레드로 돌아간다.
        // 결과적으로 UI 관련 작업을 할 때는 다시 main으로 돌려줘야 한다
        // (1). 여기서 completionHandler(data, response, error)가 실행될 때 main으로 돌리기
        // (2). 이 함수를 실행시킬 때, UI 관련 작업을 하는 곳에서 main으로 돌려주기
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 매개변수 3개 -> data가 nil(success)이거나 error가 nil(fail)
            
            // 1. error 체크
            if let error {
                completionHandler(nil)
                return
            }
            
            
            // 2. response 체크
            guard let response = response as? HTTPURLResponse,   // 타입 캐스팅
                  (200...500).contains(response.statusCode) else {
                completionHandler(nil)
                return
            }
            
            
            // 3. data 체크
            // do try catch 가 가장 일반적.
            // try? 또는 try! 도 가능하긴 하지만, 에러가 생길 때 key에 대해서 디버깅하기 까다롭다. try!는 아예 런타임 오류 가능성이 있다
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data)
                completionHandler(result)
                print("SUCCESS. RESULT :", result)
            }
            catch {
                // 여기서 프린트를 찍으면 구체적인 에러 내용을 알 수 있다
                print("ERROR : ", error)
                completionHandler(nil)
            }
        }.resume()
    }
}
