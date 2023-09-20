//
//  Photo.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation


// Codable : Decodable + Encodable
struct Photo: Decodable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Decodable {
    let id: String
    let created_at: String
    let urls: PhotoURL
}

struct PhotoURL: Decodable {
    let full: String
    let thumb: String
}

