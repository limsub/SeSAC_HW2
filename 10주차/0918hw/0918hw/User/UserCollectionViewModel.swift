//
//  UserCollectionViewModel.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import Foundation


class UserCollectionViewModel {
    
    let list: Observable< [User] > = Observable( [] )
    
    func append() {
        list.value = [
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 20),
            User(name: "Kokojong", age: 20),
            User(name: "Kok2ojong", age: 20),
            User(name: "Koko3jong", age: 20),
            User(name: "Kokojㄴong", age: 20),
            User(name: "Kokojoㄴㄴng", age: 20),
            User(name: "Kokojoㅁng", age: 20),
            User(name: "Kokojaong", age: 20),
            User(name: "Kokoajaong", age: 20),
            User(name: "Kokozjong", age: 20),
            User(name: "Kokodjong", age: 20),
        ]
    }
    
    func removeAll() {
        list.value = []
    }
    
    func removeUser(index: Int) {
        list.value.remove(at: index)
    }
    
    func insertuser(name: String) {
        list.value.insert( User(name: name, age: 300), at: 2)
    }
}
