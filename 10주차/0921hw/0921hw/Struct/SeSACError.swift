//
//  SeSACError.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import Foundation


enum SeSACError: Int, LocalizedError {
    case unauthorized = 401
    case permissionDenied = 403
    case invalidServer = 500
    case missingParameter = 400
    
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "인증 정보가 없다"
        case .permissionDenied:
            return "권한이 없다"
        case .invalidServer:
            return "서버가 문제다"
        case .missingParameter:
            return "파라미터 없다"
        }
    }
}
