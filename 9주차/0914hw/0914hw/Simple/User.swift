//
//  User.swift
//  0914hw
//
//  Created by 임승섭 on 2023/09/14.
//

import Foundation

struct User: Hashable {
    let name: String
    let age: Int
    
    var introduce: String { // 연산 프로피티로 선언. 처음부터메모리 공간을 차지하지 않고, 호출이 될 때 메모리에 등록됨
        return "\(name), \(age)"
    }
    
    private let id = UUID().uuidString
}
