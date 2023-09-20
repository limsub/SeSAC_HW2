//
//  SeSACError.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation

enum SeSACError: Int, Error, LocalizedError {
    case unauthorized = 401
    case permissionDenied = 403
    case invalidServer = 500
    case missingParameter = 400

    var errorDescription: String {
        switch self {
        case .unauthorized:
            return "인증 정보가 없어유"
        case .permissionDenied:
            return "권한이 없어요"
        case .invalidServer:
            return "서버에 문제있어요"
        case .missingParameter:
            return "파라미터가 없어요"
        }
    }
}
