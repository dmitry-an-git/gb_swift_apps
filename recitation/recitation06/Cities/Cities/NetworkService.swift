//
//  NetworkService.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    //weak var delegate: NetworkServiceDelegate?
    
    func getCities(completion: @escaping ([City]) -> Void) {
        
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords") else {
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                return
            }
        
            do {
                let cities:[City] = try JSONDecoder().decode([City].self, from: data)
                print(cities)
                completion(cities)
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    func decodeError(code: String) {
        
        guard let url = URL(string: "https://http.cat/\(code)") else {
            return
        }
        
        session.dataTask(with: url) { data, _, _ in
            print(data!)
        }.resume()
    }
    
    func getNews() {
        let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=ru&fields=publication_date,title,body_text&expand=&order_by=&text_format=text&ids=&location=&actual_only=true")
    
        session.dataTask(with: url!) { data, response, error in
            
            guard let data else {
                return
            }
        
            do {
                let news = try JSONDecoder().decode(NewsCodable.self, from: data).results
                print(news)
            } catch {
                print(error)
            }
            
        }.resume()
               
    }
    
    func getPlaces() {
        let url = URL(string: "https://kudago.com/public-api/v1.4/places/?lang=ru&fields=title&expand=&order_by=&text_format=&ids=&location=&has_showings=&categories=&lon=&lat=&radius=")
  
        session.dataTask(with: url!) { data, response, error in
            
            guard let data else {
                return
            }
        
            do {
                let news = try JSONDecoder().decode(PlacesCodable.self, from: data).results
                print(news)
            } catch {
                print(error)
            }
            
        }.resume()
    
    }


    
    func getMovies() {
        let url = URL(string: "https://kudago.com/public-api/v1.4/movies/?lang=&fields=site_url,title,body_text,country,year,imdb_rating&expand=&order_by=&text_format=&ids=&location=&premiering_in_location=")
  
        session.dataTask(with: url!) { data, response, error in
            
            guard let data else {
                return
            }
        
            do {
                let news = try JSONDecoder().decode(MoviesCodable.self, from: data).results
                print(news)
            } catch {
                print(error)
            }
            
        }.resume()
    
    }

    func getDogURL() {
        
        let url = URL(string: "https://random.dog/woof.json")
        
        session.dataTask(with: url!) { data, _, _ in
            
            guard let data else {
                return
            }
        
            do {
                let dog = try JSONDecoder().decode(DogCodable.self, from: data)
                print(dog)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
