//
//  CalculateViewModel.swift
//  0913hw
//
//  Created by 임승섭 on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    
    // 1. 데이터
    var firstNum: Observable<String?> = Observable("0")
    var secondNum: Observable<String?> = Observable("0")
    var result = Observable("결과")
    
    // 2. 연산
    func calculate() {
        
        guard let first = firstNum.value, let first = Int(first),
              let second = secondNum.value, let second = Int(second) else {
            result.value = "오류 발생"
            return
        }
        
        result.value = "결과는 \(format(for: first + second)) 입니다"
    }
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
}
