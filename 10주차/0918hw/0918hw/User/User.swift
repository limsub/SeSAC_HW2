//
//  User.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import Foundation


// User 구조체 만들기 (Hashable) -> class vs. struct

// 1. struct
struct User: Hashable {
    let name: String
    let age: Int
    
    var introduce: String {
        return "\(name), \(age)살"
    }
    
    private let id = UUID().uuidString
}


// 2. class
// + (1). init    (2). Equatable      (3). hash 함수
class User2: Hashable {
    let name: String
    let age: Int
    
    var introduce: String {
        return "\(name), \(age)살"
    }
    
    private let id = UUID().uuidString
    
    // (1)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // (2)
    static func == (lhs: User2, rhs: User2) -> Bool {
        lhs.id == rhs.id
    }
    
    // (3)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
