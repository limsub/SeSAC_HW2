//
//  SampleViewModel.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation

struct User {
    let name: String
    let age: Int
    
    var introduce: String {
        return "\(name), \(age)"
    }
}

// 1. 데이터
// 2. 데이터들을 연산해서 내는 결과

class SampleViewModel {
    
    // 1. 데이터
    var list = [
        User(name: "a", age: 10),
        User(name: "b", age: 102),
        User(name: "c", age: 44),
        User(name: "d", age: 98),
        User(name: "e", age: 12)
    ]
    
    // 2. 데이터들의 연산 결과
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
    
    
}
