//
//  SendDataProtocol.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import Foundation

// weak으로 선언하려면 AnyObject 채택해주기
protocol SendDataProtocol {
    func receiveText(_ text: String)
}
