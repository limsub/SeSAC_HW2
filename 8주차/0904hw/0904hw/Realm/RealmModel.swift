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
    
    @Persisted var title: String    // 제목 필수
    @Persisted var contents: String?
    @Persisted var imageURL: String?
    
    @Persisted var memomemo: String?    // 변경
    @Persisted var summary: String?     // 결합 (title + contents)
    
//    @Persisted var add1: String?    // 추가   // 제거
    
    convenience init(title: String, contents: String, imageURL: String, memo: String = "") {
        self.init()
        self.title = title
        self.contents = contents
        self.imageURL = imageURL
        self.memomemo = memo
        
        self.summary = title + contents
    }
    
}
