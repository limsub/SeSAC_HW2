//
//  BookTableRepository.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/06.
//

import Foundation
import RealmSwift

// CRUD

protocol BookTableRepositoryType: AnyObject {
    
    // C
    func createItem(_ item: BookTable)
    
    // R
    func fetch() -> Results<BookTable>
    func fetchFilter() -> Results<BookTable>
    
    // U
    func updateItem(_ value: [String: Any])
    
    // D
    func deleteItem(_ item: BookTable)
}

class BookTableRepository: BookTableRepositoryType {
    
    private let realm = try! Realm()
    
    // C
    func createItem(_ item: BookTable) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
    }
    
    // R
    func fetch() -> Results<BookTable> {
        return realm.objects(BookTable.self).sorted(byKeyPath: "title", ascending: true)
    }
    
    func fetchFilter() -> Results<BookTable> {
        let data = realm.objects(BookTable.self).where {
            $0.title.contains("아이유", options: .caseInsensitive)
        }
        return data
    }
    
    // U
    func updateItem(_ value: [String : Any]) {
        do {
            try realm.write {
                realm.create(BookTable.self, value: value, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    // D
    func deleteItem(_ item: BookTable) {
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print(error)
        }
    }
    
}

