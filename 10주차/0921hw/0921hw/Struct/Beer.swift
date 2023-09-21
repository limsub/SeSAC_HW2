//
//  Beer.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import Foundation

typealias Beer = [BeerElement]

struct BeerElement: Codable, Hashable {
    let id: Int
    let name, firstBrewed : String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case firstBrewed = "first_brewed"
        case imageURL = "image_url"
    }
}
