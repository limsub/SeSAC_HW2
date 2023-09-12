//
//  Observable.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation


class Observable<T> {
    
    private var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value) // 값이 바뀔 때마다 실행
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void ) {
        closure(value)
        listener = closure
    }
    
}
