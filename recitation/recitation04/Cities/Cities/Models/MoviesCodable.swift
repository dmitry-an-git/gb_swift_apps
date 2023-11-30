//
//  MoviesCodable.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct MoviesCodable: Codable {
    let results: [Movie]
    
    struct Movie: Codable {
        // site_url,title,body_text,country,year,imdb_rating
        let siteUrl: String
        let title: String
        let bodyText: String
        let country: String
        let year: Int
        let imdbRating: Double
        
        enum CodingKeys: String, CodingKey {
            case siteUrl = "site_url"
            case title
            case bodyText = "body_text"
            case country
            case year
            case imdbRating = "imdb_rating"
        }
    }
}
