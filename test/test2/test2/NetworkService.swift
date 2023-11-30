//
//  NetworkService.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import UIKit

class NetworkService {
    
    private var session = URLSession.shared
    
    func getCities(completion: @escaping ([City]) -> Void) {

        guard let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords") else {
            return
        }
        
        session.dataTask(with: url) {data, _, _ in
            guard let data else {
                return
            }
            
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(cities)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
