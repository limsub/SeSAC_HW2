//
//  Observable.swift
//  0824hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
    }
}
