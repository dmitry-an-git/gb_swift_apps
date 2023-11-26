//
//  ImageViewController+Extensions.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import UIKit

extension UIImageView {
    
    func getDog() {
        
        let url = URL(string: "https://random.dog/woof.json")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: url!) { data, _, _ in
            
            guard let data else {
                return
            }
        
            do {
                let url_txt = try JSONDecoder().decode(DogCodable.self, from: data).url
                print(url_txt)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
