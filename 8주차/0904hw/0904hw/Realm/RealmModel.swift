//
//  RealmModel.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/04.
//

import Foundation
import RealmSwift

class BookTable: Object {
    
    
    @Persisted(primaryKey: true) var _id:ObjectId
    
    @Persisted var title: String
    @Persisted var contents: String
    @Persisted var imageURL: String
    
    convenience init(title: String, contents: String, imageURL: String) {
        self.init()
        self.title = title
        self.contents = contents
        self.imageURL = imageURL
    }
    
}
