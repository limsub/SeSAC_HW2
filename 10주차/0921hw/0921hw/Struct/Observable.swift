//
//  Observable.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import Foundation


class Observable<T> {
    
    private var listener: ( (T) -> Void)?
    
    var value: T {
        didSet {
            print("리스너 실행")
            print(value)
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print("바인드 실행")
        self.listener = closure
    }
}
