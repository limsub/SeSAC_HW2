//
//  LottoViewModel.swift
//  0913hw
//
//  Created by 임승섭 on 2023/09/13.
//

import Foundation
import Alamofire

struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}

class LottoViewModel {
    // 1. 데이터
    let rounds: [Int] = Array(1...1084).reversed()
    var results: Observable<String?> = Observable("")
    
    // 2. 연산
    func callRequest(_ round: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200...500)
            .responseDecodable(of: Lotto.self)  { response in
                let statusCode = response.response?.statusCode ?? 500
                
                if (statusCode == 200) {
                    guard let value = response.value else { return }
                    
                    self.results.value = "\(value.drwtNo1), \(value.drwtNo2), \(value.drwtNo3), \(value.drwtNo4), \(value.drwtNo5), \(value.drwtNo6), 뽀너스 : \(value.bnusNo)"
                }
                else {
                    print("Error!! StatusCode : \(statusCode)")
                }
            }
    }
    
    func numberOfRowsInComponents() -> Int {
        return rounds.count
    }
    
    func titleForRow(_ row: Int) -> String {
        return "\(rounds[row])회"
    }
}


