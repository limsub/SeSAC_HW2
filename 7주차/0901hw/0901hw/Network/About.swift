//
//  About.swift
//  0901hw
//
//  Created by 임승섭 on 2023/09/01.
//

import Foundation


struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Codable {
    let id: String
    let urls: PhotoURL
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}
