//
//  City.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import Foundation

struct City: Decodable {
    let name: String
    let timeZone: String?
    let currency: String?
    let coords: Coordinates?
    
    struct Coordinates: Decodable {
        let lon: Double?
        let lat: Double?
    }
}
