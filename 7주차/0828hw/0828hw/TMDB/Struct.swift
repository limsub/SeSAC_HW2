//
//  Struct.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import Foundation


/* ==================== 영화 리스트 ==================== */
struct MovieList: Codable {
    let page: Int
    let results: [Result]
    let totalResults, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Result: Codable {
    let video: Bool
    let voteCount: Int
    let overview, releaseDate: String
    let voteAverage: Double
    let genreIDS: [Int]
    let originalTitle, backdropPath, posterPath: String
    let id: Int
    let mediaType: MediaType
    let originalLanguage: String
    let popularity: Double
    let title: String
    let adult: Bool

    enum CodingKeys: String, CodingKey {
        case video
        case voteCount = "vote_count"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case popularity, title, adult
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}




/* ==================== 장르 리스트 ==================== */
struct GenreList: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let name: String
    let id: Int
}



/* ==================== 영화 세부정보 ==================== */
struct MovieDetail: Codable {
    let crew: [Cast]
    let id: Int
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let character: String?
    let profilePath: String?
    let creditID: String
    let order, castID: Int?
    let popularity: Double
    let gender: Int
    let originalName, knownForDepartment: String
    let adult: Bool
    let name: String
    let id: Int
    let job, department: String?

    enum CodingKeys: String, CodingKey {
        case character
        case profilePath = "profile_path"
        case creditID = "credit_id"
        case order
        case castID = "cast_id"
        case popularity, gender
        case originalName = "original_name"
        case knownForDepartment = "known_for_department"
        case adult, name, id, job, department
    }
}

