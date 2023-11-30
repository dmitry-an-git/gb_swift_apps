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
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            
            guard let data else {
                print("No data1 received")
                return
            }
        
            let url_txt = try?  JSONDecoder().decode(DogCodable.self, from: data).url
            guard let urlData = URL(string: url_txt ?? "") else { return }
            
            URLSession.shared.dataTask(with: urlData) { [weak self] data, _, _ in
                guard let data, let pic = UIImage(data:data) else { return }
                DispatchQueue.main.async {
                    self?.image = pic
                }
            }.resume()
        }.resume()
        
    }
    
    }
